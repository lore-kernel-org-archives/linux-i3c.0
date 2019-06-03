Return-Path: <SRS0=pNSd=UC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6458C282CE
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jun 2019 12:03:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA8423BCA
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jun 2019 12:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VFOoHqKU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FA8423BCA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hewMHJiophI8DgWZh6X8IY1N6oRFgsIgSaqhIa56zdQ=; b=VFOoHqKUpjoBaw
	8HVqLqZDMZQRoZP7JjT8+SbEdpeKcaTwPjCBY4x7orjXusA7im+O6GBxFsp4Xg9KvQt0eaF+cL6RN
	JH2iA59iynZjXQAPYPxwIH9bJii5/NlsUC4oq+WFN0E9gCBfB7H7tqa5gZo6CpXGIsGErk8PE2aJ8
	Jv0Kr7aTUGQPSSAQG8AmZeC01oIj8Byt7rzNT2rLpBB6nFaLRcWSV5CM7U1Zrm4FAG7tCSMocwgPy
	LkxA30UXHbevcU7fX4EkuuH5fVCpHpEnecSjYhn4mlx44TPduayDO836HNGGpybgP/ehiruCXgqFD
	tqjtXBYux7KRNIpgE+eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXlgN-0005hg-3x; Mon, 03 Jun 2019 12:03:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXe0o-0005nb-Ts; Mon, 03 Jun 2019 03:51:56 +0000
X-UUID: aa4415f8c9ad44e2aea9016735ee2f23-20190602
X-UUID: aa4415f8c9ad44e2aea9016735ee2f23-20190602
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1440770055; Sun, 02 Jun 2019 19:51:21 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 2 Jun 2019 20:51:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 3 Jun 2019 11:51:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 3 Jun 2019 11:51:17 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 1/2] dt-bindings: i3c: Document MediaTek I3C master bindings
Date: Mon, 3 Jun 2019 11:51:02 +0800
Message-ID: <1559533863-10292-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
References: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_205154_968296_7369B8EA 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 03 Jun 2019 05:03:17 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com, gregkh@linuxfoundation.org, xinping.qian@mediatek.com,
 linux-kernel@vger.kernel.org, liguo.zhang@mediatek.com,
 linux-mediatek@lists.infradead.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-i3c@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Document MediaTek I3C master DT bindings.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt

diff --git a/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
new file mode 100644
index 0000000..89ec380
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
@@ -0,0 +1,50 @@
+Bindings for MediaTek I3C master block
+=====================================
+
+Required properties:
+--------------------
+- compatible: shall be "mediatek,i3c-master"
+- reg: physical base address of the controller and apdma base, length of
+  memory mapped region.
+- reg-names: should be "main" for controller and "dma" for apdma.
+- interrupts: interrupt number to the cpu.
+- clock-div: the fixed value for frequency divider of clock source in i3c
+  module. Each IC may be different.
+- clocks: clock name from clock manager.
+- clock-names: must include "main" and "dma".
+
+Mandatory properties defined by the generic binding (see
+Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+
+- #address-cells: shall be set to 3
+- #size-cells: shall be set to 0
+
+Optional properties defined by the generic binding (see
+Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+
+- i2c-scl-hz
+- i3c-scl-hz
+
+I3C device connected on the bus follow the generic description (see
+Documentation/devicetree/bindings/i3c/i3c.txt for more details).
+
+Example:
+
+	i3c0: i3c@1100d000 {
+		compatible = "mediatek,i3c-master";
+		reg = <0x1100d000 0x100>,
+		      <0x11000300 0x80>;
+		reg-names = "main", "dma";
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <16>;
+		clocks = <&i3c0_ck>, <&ap_dma_ck>;
+		clock-names = "main", "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-scl-hz = <100000>;
+
+		nunchuk: nunchuk@52 {
+			compatible = "nintendo,nunchuk";
+			reg = <0x52 0x80000010 0>;
+		};
+	};
-- 
1.7.9.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
