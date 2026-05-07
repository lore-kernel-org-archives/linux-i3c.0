Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E80ACD3427
	for <linux-i3c@archiver.kernel.org>; Thu,  7 May 2026 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPXP0r0V/f/OY/VFL9GfdzXbtCugaNcKL6Wf8znhmrQ=; b=0O3fIxykq37mCS
	Wb2sdEO5lZQv+N0PUhjp58AEVUedWA127HjS3P+k5fWlX0csG/eNooFnBRdJ4KVvYOz9pl3V9KeiJ
	t2SuzLIXH/Qg8zxNqjTGXOAfy2sHIA0EPEzlujJJZppU1gCW3kIFanBIko3X1FgOyEvRpTPPXYmxp
	kBLnM/I/P6MHs5Ud9yUJ4iZ3248Dx/5B/hQ+DbQtodylvTR1hlpQnsi7kAIZJpuN0D/5yxTQsL7Fr
	4uDbJqRGC6q83WYdhQPmOcOnEU5LxkQAv7axsNjyoE15Pgud6yOUdp8atYmnrbQwmNDFoxBa4eAc1
	mYPAiWRWC0yOMCDCXH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPs-00000003Ejr-0LVg;
	Thu, 07 May 2026 08:49:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPr-00000003Eis-13dF;
	Thu, 07 May 2026 08:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OvmRDR5x7WzntKn174vXn0ru1Bqpf6/zS18CFvL1LRA=; b=bFpgii3UhHGcswbaXA6pEZSg0h
	3DV4em0RiJGtz6WcacpLDbbQV6kN5PIXzm0x5i38R8xkWulPbggdwgouu/6JnU7ufnnOiKkR0ec2r
	TbpOnkYslKmYI5vHYcDmsIquiTcuayUshmhcGQvxAArKHpy8QJ/8Ow0nvTH1Px39lsecU9fmM5PwU
	SPFqIZD4fkT6kRgoEaj4uiMBotd3By/Lf7w2Gh7xEKBtvy95Pj2IBdaPAq6fA5NqrWELX/iQusmCu
	cGTBeUkQYNt62STjG4+No6lQB8FzSA/y9ZhK9/ubI6CmtrkFNxsYtAPMdsw0Kz+/yK1Fr56kd9w3m
	UT222VsQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPn-00000002xrY-3DzX;
	Thu, 07 May 2026 08:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778143745; x=1809679745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J+RRQPbB840porDSbhRTVRNhSav/l2Jkdv58LrmAG3s=;
  b=Fc+3AABJ06Yo5tyYqnaTPsM4XFsgI/CQkLdT9TeokKlbKOj4+cGIBz9s
   gcvRMVT8KqQM8LfipVV2cmYL0ZimraDrx/SslXm4P+hNCnrAFtvR+aMZl
   iexAOTCR8GQYGL6w7lng+d+meKnypHAhGzSCROz3wwaS89QQutzM0G7e8
   fABTB9+KJc+dcqFPtcKu5+4tHoPNbHIKR4uYd2UN1fNTQ8V31uTXQMvX3
   aIo3XTzpOr6MIG8AD6WPtBgxx4/9FA+j/qAXOWuTSWi6SRTOYaku29GtH
   q6UrhrI8UTuJ+bkbzQoFoUOSEio+91feTy+WKhYXVkpXTGTBV4GL9qBVU
   A==;
X-CSE-ConnectionGUID: d158uM31R8GCfh5/8Dch5w==
X-CSE-MsgGUID: H6kpgzg9TkSAZrAfv2gzUg==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="288533336"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2026 01:48:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 7 May 2026 01:48:57 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 01:48:49 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <tytso@mit.edu>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <durai.manickamkr@microchip.com>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 4/5] ARM: dts: microchip: add I3C controller
Date: Thu, 7 May 2026 14:18:04 +0530
Message-ID: <20260507084805.481737-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260507084805.481737-1-manikandan.m@microchip.com>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_094904_486559_74C0B338 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add I3C controller for sama7d65 SoC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Remove clock-names property as driver enables the clk in bulk

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 67253bbc08df..ec200848c153 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -1055,5 +1055,13 @@ gic: interrupt-controller@e8c11000 {
 			#address-cells = <0>;
 			interrupt-controller;
 		};
+
+		i3c: i3c@e9000000 {
+			compatible = "microchip,sama7d65-i3c-hci";
+			reg = <0xe9000000 0x300>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc PMC_TYPE_GCK 105>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
