//
//  CustomSegmentedView.swift
//  CoinCak
//
//  Created by mac on 10/03/25.
//

import SwiftUI

struct SegmentedView<Element, Content, Selection>: View where Content: View, Selection: View {
    
    public typealias Data = [Element]
    
    /// Stores the size of each segment dynamically.
    @State private var segmentSizes: [Data.Index: CGSize] = [:]
    
    /// A binding to track the selected item.
    @Binding private var selectedIndex: Data.Index?
    
    private let data: Data
    
    /// A closure that returns a view for the selection indicator
    private let selection: () -> Selection
    
    /// A closure that generates a segment view, with a Bool indicating if it's selected.
    private let content: (Data.Element, Bool) -> Content
    
    /// Defines how the selection indicator is aligned vertically.
    private let selectionAlignment: VerticalAlignment
    
    public init(_ data: Data,
                selectedIndex: Binding<Data.Index?>,
                selectionAlignment: VerticalAlignment = .center,
                @ViewBuilder content: @escaping (Element, Bool) -> Content,
                @ViewBuilder selection: @escaping () -> Selection) {
        
        self.data = data
        self.content = content
        self.selection = selection
        self._selectedIndex = selectedIndex
        self.selectionAlignment = selectionAlignment
    }
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .horizontalCenterAlignment,
                                    vertical: selectionAlignment)) {
            
            if let index = selectedIndex {
                selection()
                    .frame(width: selectionSize(at: index).width,
                           height: selectionSize(at: index).height)
                    .alignmentGuide(.horizontalCenterAlignment) { dimensions in
                        return dimensions[HorizontalAlignment.center]
                    }.animation(.easeInOut(duration: 0.3), value: selectedIndex)
            }
            
            HStack(spacing: 0) {
                ForEach(data.indices, id: \.self) { index in
                    Button(action: { selectedIndex = index },
                           label: { content(data[index], selectedIndex == index) }
                    )
                    .buttonStyle(PlainButtonStyle())
                    .background(GeometryReader { proxy in
                        /// Gives background color based on the view's size
                        /// Will send triggers by the key to provide an updated size depending on the contents
                        Color.clear.preference(
                            key: SegmentSizePreferenceKey.self,
                            value: SegmentSize(index: index, size: proxy.size)
                        )
                    })
                    /// Will receive the updates by the key
                    .onPreferenceChange(SegmentSizePreferenceKey.self) { segment in
                        segmentSizes[segment.index] = segment.size
                    }
                    .alignmentGuide(.horizontalCenterAlignment,
                                    isActive: selectedIndex == index) { dimensions in
                        dimensions[HorizontalAlignment.center]
                    }
                }
            }
        }
    }
}

private extension SegmentedView {
    
    func selectionSize(at index: Data.Index) -> CGSize {
        return segmentSizes[index] ?? .zero
    }
}

private extension SegmentedView {
    struct SegmentSize: Equatable {
        let index: Int
        let size: CGSize
    }
    
    struct SegmentSizePreferenceKey: PreferenceKey {
        static var defaultValue: SegmentSize { SegmentSize(index: .zero, size: .zero) }
        
        static func reduce(value: inout SegmentSize,
                           nextValue: () -> SegmentSize) {
            
            value = nextValue()
        }
    }
}

extension HorizontalAlignment {
    private enum CenterAlignmentID: AlignmentID {
        static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
            return dimension[HorizontalAlignment.center]
        }
    }
    
    static var horizontalCenterAlignment: HorizontalAlignment {
        HorizontalAlignment(CenterAlignmentID.self)
    }
}

#Preview {
    SegmentedView(["1", "2", "3"],
                  selectedIndex: .constant(0),
                  selectionAlignment: .center, content: { item, isSelected in
        Text(item)
            .foregroundColor(isSelected ? Color.black : Color.gray)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        
    }, selection: {
        VStack(spacing: 0) {
            Spacer()
            Rectangle()
                .fill(Color.black)
                .frame(height: 1)
        }
    })
}

extension View {
    @ViewBuilder
    @inlinable func alignmentGuide(_ alignment: HorizontalAlignment,
                                   isActive: Bool,
                                   computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View {
        if isActive {
            alignmentGuide(alignment, computeValue: computeValue)
        } else {
            self
        }
    }
    
    @ViewBuilder
    @inlinable func alignmentGuide(_ alignment: VerticalAlignment,
                                   isActive: Bool,
                                   computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View {
        
        if isActive {
            alignmentGuide(alignment, computeValue: computeValue)
        } else {
            self
        }
    }
}
