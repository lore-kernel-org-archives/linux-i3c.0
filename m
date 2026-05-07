Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13689CD3427
	for <linux-i3c@archiver.kernel.org>; Thu,  7 May 2026 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=35AIPIgCvT8wDkn1gqiBeE9i5TWw+M7VaPEsECMhjLQ=; b=P/TbhFWTO51Xml
	3eCRR3CenzenKfYfq67+46iR3PW1Pf6CCaOo6CQtSaRyjIpst3I4itYwuQwAAoGla4l8mFB1wwgPz
	QqQc4UdkXWwQMh4uzu3awCj6XMpGJgcM9tYij3z8DTD/O7htZpkMtIGY9yFTNP9Corgn877rqho4Y
	XxoCV+lATnSNZvHVlvNRDXc1Gq+wpiA73sGKORKYNOelD81bEKmE6+Pdfu3IqM5/61ZkqMCtb3Bp4
	1t5CKpZzCtw820jJx/zf6apdBwFeEG8ALqmfj2SFSUjIz6VjYQCvHv2HX8GaE7FZ3DJPVyZUtG0c3
	Af1AlZB8cjcHSTeU2mtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuPA-00000003EBH-3Qdc;
	Thu, 07 May 2026 08:48:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuP8-00000003EA4-2ooG;
	Thu, 07 May 2026 08:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778143703; x=1809679703;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vPRwvxMb5A9mdiX3Oz9wTv571xXQ5Sv70RbsEc7FkgU=;
  b=HrjHsYikL+eUcq2F8O0O4dBj9BdEsYk62aeUmCgxty6w18vqiRM1Zc46
   KBCrc2IJoBQ05gn90MLqkTtC5MRP4iCUX3/cNlsg0nHlr+8PrtqCpudS0
   JryA/hNgQuG8UMPIQsyxpvu1y0Ul81rTwHk55WbRdX7EES7E70fIHSLTE
   7i+p6OAMXQaC9Udxqv6HUzcJpf6giaK5iiQ7oHr/trmDRBpavIItTzgmb
   FD+kJwosJtkUIi6t85YBtf7GXj0qKK5vE8Fh4FLgvMiRdIukxC4sLXOMZ
   50I89KOXJDsLlgs2qcf4w8fbkGjIohOoaWleUIrpvBiZ+vYn9AIB4fgtM
   g==;
X-CSE-ConnectionGUID: ljsisRZxTBOMkS3YHim8dQ==
X-CSE-MsgGUID: Ig6znDXhROWm1UMuhm6iRw==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="288533272"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2026 01:48:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 7 May 2026 01:48:21 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 01:48:12 -0700
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
Subject: [PATCH v6 0/5] Add microchip sama7d65 SoC I3C support
Date: Thu, 7 May 2026 14:18:00 +0530
Message-ID: <20260507084805.481737-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014822_724721_9EFFE57F 
X-CRM114-Status: GOOD (  10.38  )
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

Add support for microchip sama7d65 SoC I3C master only IP which is
based on mipi-i3c-hci from synopsys implementing version 1.0
specification. The platform specific changes are integrated in the
mipi-i3c-hci driver using existing quirks

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Please refer to the individual patches for changelogs.

base-commit: 8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc

Durai Manickam KR (2):
  clk: at91: sama7d65: add peripheral clock for I3C
  ARM: dts: microchip: add I3C controller

Manikandan Muralidharan (3):
  dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the
    required quirk
  ARM: configs: at91: sama7: add sama7d65 i3c-hci

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 ++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 10 +++++++
 5 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
