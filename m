Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59123CD484A
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Sep 2023 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1z+km/sz1WOpnQNW5GDa/MO3Haic+kMXoyvwSmKRG/Y=; b=f7gMv0koY9AjFB
	xqHGET9Tx3ZCrHi0/rif4rKB+cZsQMrYJ2IRiKRWZs/4xwt4d1TUXXtxC10KbZ8FgjnP15G/IF5UD
	8jB2tvf4Gk+uHLxaOYQ3+xmalBpllyqFQs69yTK7hi8/5uoeGCMEu5h+ZKT2Mf/BxiqfP1q0KWxW5
	rzjHZ1hsHiNzYRecxI3/PD4o8Z/D4OcY0Yx0to95Twqhek/guz0YyIPioMJUScodNdpkJGMUPTyYG
	5MMnCdDq40ZNxHhewD8sQYgktkJyZjXFpJhj7LtW7TKElPkClQm1igEwUhFB269qaCLHx/swki8Y/
	7O5vPvfjsOJNKij9kJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIN-009YHB-0B;
	Fri, 22 Sep 2023 17:50:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIJ-009YFw-2W
	for linux-i3c@lists.infradead.org;
	Fri, 22 Sep 2023 17:50:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c39f2b4f5aso20480785ad.0
        for <linux-i3c@lists.infradead.org>; Fri, 22 Sep 2023 10:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405021; x=1696009821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnSUWF58ojeWw3KcW4a/aInndGgQ4B+bmfIwHKF+S5o=;
        b=c7CSTzaScY0hpdD/8e7wKpAHiqmtf2+I5SsZOCAuAWlxlIAKJWAJVKHHhfBflgazfN
         5SH/8i7K9ukvjhyK49TUz9+0UapC6I3N1HhcvLl6cKCoWDukTVSbucpcIFxdUKVTwYvB
         sND5lDy0z9BL6IwS4T2n64K0gfNTzW6mWzhS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405021; x=1696009821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnSUWF58ojeWw3KcW4a/aInndGgQ4B+bmfIwHKF+S5o=;
        b=ddG54sI4DYF16bRmherYd8beBAcA9JXmN3qLrQZw4Z+8K2hbBh8iK4pbBSDvaFmSaz
         yvgNlb8hVmnLvTaTa3GukjYXT4rkW990IIGNYzqR1bOokBazzANP+DQ78T8up4feWqn4
         P7XOcLZXySuk/t4jn/8+R5Y5/Tk+KJiwm06kxaOvhNyF/NwhXicyuFRvytTQDcspfNFq
         zbEn39GS5Z47dir4jYJHoDGcHjuRP1lkWWhBZ8XMBNFF8xVdxorEMJw+ceTpzapLII+Q
         8d0dtgwDYZcuBrpVfkPV0gMXrzpc/0BLyB4WiNwzUlDW/YgRcotStT5Bg8FTo+m2GEgg
         efgw==
X-Gm-Message-State: AOJu0YyjzAUE36aNjRHjchsRw+eP9cErtrWISEhxBUb3b/9d4b30wnvB
	zRSBocRgsSx7CDzhsZXbnq/8iw==
X-Google-Smtp-Source: AGHT+IEpwE+lbw9N8VqTU6cLI1njnvdhNqJvkC4T2WCQ+CtSy2geBYXLs4Lb8xITWNjg+VuykJZz8g==
X-Received: by 2002:a17:903:2348:b0:1c4:13cd:b85f with SMTP id c8-20020a170903234800b001c413cdb85fmr154761plh.5.1695405021369;
        Fri, 22 Sep 2023 10:50:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090276c700b001c0bf60ba5csm3750500plt.272.2023.09.22.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	Len Baker <len.baker@gmx.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i3c/master/mipi-i3c-hci: Annotate struct hci_rings_data with __counted_by
Date: Fri, 22 Sep 2023 10:50:19 -0700
Message-Id: <20230922175019.work.129-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=keescook@chromium.org;
 h=from:subject:message-id; bh=VnYZTZQDzvs6FPCd796RbHEvmVY4nxS6fY7pQ/TUq58=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPb7evFPyNbPT0FdckJpxJpxqM4N1hl+rZT8
 PBWQWPuA6SJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T2wAKCRCJcvTf3G3A
 JknqD/4/xs4n4EK36LHG01DepzXWVJmm7fPp0/czFh0mjmYFE+bK4F26rpn6lgsBQhf7ZjQ0Oj9
 nKVj0QLvgCFAtpBT32huepq+fL5RwuTNOtJ2/XlgSeNhVNO5huuxSsL7qveP4T2OJRJUWgxsG5S
 QKEU1ED/1P4CSCOEVITabzeBZjqANlqDE8aZVqz48j+C7Su+O2MeQZ8+tgA7ApE0UIynp599kxT
 hirXsgBk1UnxTKiCT/8YogzSWpIJP/kCfQBluYyuNgjXU6ByV771+6OFIHXuW1E5us27fhmapqS
 AgHC5MfhZAvS50WOCpsVNDXSCe0dM9hnEPgA6yscEl3Y5z6OE6D7GZBsj0C8T5ksP4j/kIZHQ3S
 eTPF69qS8MYYgPaCYKJi727lFoCd8EVEZhT5njFT2SWBdE83dALCTI5SisWRPjcAHSTJk/5TSpf
 wsaA+sMNRgxMRlF10ZSBfoDRlDd6HDPFL/leLCXvJMyCXNuNgs+EBtVHvlrte+K44NEq3qlVb5F
 ZXGWXTLNs6/9I4s5DWl3JrRbuvoTOUGWi9Pdc+RmUPx0sU3LAJgltK/3gAwmfpJEZHJVRuDmxuX
 Nu+VZAWXphQB9Gs3lc6M9eEGG+ijJjygN/yin4pvq+fQY13ztOFq8RKo7MKTBrH8D/1AfABwnBH
 0WbbyJb xBwZlDsA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_105023_817604_9657DD7B 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct hci_rings_data.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Pitre <npitre@baylibre.com>
Cc: Len Baker <len.baker@gmx.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 2990ac9eaade..a1ecdfc35641 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -139,7 +139,7 @@ struct hci_rh_data {
 
 struct hci_rings_data {
 	unsigned int total;
-	struct hci_rh_data headers[];
+	struct hci_rh_data headers[] __counted_by(total);
 };
 
 struct hci_dma_dev_ibi_data {
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
