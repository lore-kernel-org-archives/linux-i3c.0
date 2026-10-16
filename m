Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F6ACCA46C
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xv71cxtermEkkyRZ8YHQxJJdPhCxbLD71nBvOUH1HTA=; b=EKFSIGGMwKFwQF
	qTjksUDPJX0ugQEljaMt+kDV38isriZ+NYmS1YoCvygxLv+fuQwH156XIH1jEE+NElSmxWyJ999YJ
	oxjCbApDLDZWQ31JicsIyw2Qqwy6jtD3tXdlC6ZKzrdPTo4Au/Rym5n9MoemVgeo4ePS+oGKbjp6I
	xgN+WCNtUvI4vaBpKTTgG350pqIoEBDZpCZ9Y8sTIbj5j/inG/jNX9p8tsEp8Nqh9GSHS1vyxD+/z
	P87Ob7yvM4AmPAh2sdhQgqx70o3AyYz8xBc2dZyahqq1JENxOjScj9g3k7o/gvKQ89tG0p8OQMo3u
	Xgio+FKD5uFtv98OR+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl51-00000003Ryq-2Zxw;
	Fri, 16 Oct 2026 16:46:51 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl4z-00000003Rxb-0BNT
	for linux-i3c@lists.infradead.org;
	Fri, 16 Oct 2026 16:46:51 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E66F20021C;
	Fri, 16 Oct 2026 18:46:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EB86920000B;
	Fri, 16 Oct 2026 18:46:46 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2889818000B1;
	Sat, 17 Oct 2026 00:46:43 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com,
	linux-gpio@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [RFC PATCH 3/7] dt-bindings: i3c: nxp,p3h2840: add clock-frequency for SMBus target ports
Date: Fri, 16 Oct 2026 22:16:21 +0530
Message-Id: <20261016164625.3166779-4-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094649_220051_844DD77B 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

The SMBus Controller Agent selects the bus speed per transaction through
the transaction descriptor, and supports four discrete rates: 100 kHz,
200 kHz, 400 kHz and 1 MHz.

Describe the standard 'clock-frequency' property for the smbus@ target
port nodes so the rate can be specified per port. The property is already
available through the i2c-controller.yaml reference; restrict it to the
four rates the hardware implements so an unsupported value is rejected at
build time rather than being silently rounded. Target ports default to
400 kHz when the property is absent.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
---
 .../devicetree/bindings/i3c/nxp,p3h2840.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
index 09508a7bcbeb..66f9e2b982b1 100644
--- a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
@@ -168,6 +168,14 @@ patternProperties:
         description:
           Enables the on-die pull-up for Target Port.
 
+      clock-frequency:
+        enum: [100000, 200000, 400000, 1000000]
+        default: 400000
+        description:
+          SMBus clock rate for this Target Port. The SMBus Controller Agent
+          supports four discrete speeds, selected per transaction. When this
+          property is absent the Target Port runs at 400 kHz.
+
     required:
       - reg
 
@@ -248,6 +256,7 @@ examples:
                 reg = <0x0>;
                 #address-cells = <1>;
                 #size-cells = <0>;
+                clock-frequency = <400000>;
                 nxp,pullup-enable;
             };
 
@@ -255,6 +264,7 @@ examples:
                 reg = <0x1>;
                 #address-cells = <1>;
                 #size-cells = <0>;
+                clock-frequency = <100000>;
                 nxp,pullup-enable;
             };
 
@@ -317,6 +327,7 @@ examples:
                 reg = <0x0>;
                 #address-cells = <1>;
                 #size-cells = <0>;
+                clock-frequency = <1000000>;
                 nxp,pullup-enable;
             };
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
