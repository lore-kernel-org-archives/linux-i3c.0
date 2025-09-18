Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43017CAC59A
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DX/cYbRO07+CIVnorI4tPJm+HJ2vJCSsdeehGo1zrKo=; b=BgCOd5n86bLXvk
	05piUqf/cihE6ZlnXwWK856qoaRhPMxCZpzGiqHBi6jBA5dZadqutHg7k043X1GC1ki12c1+IwoMk
	aiNzGVHE+Kcnoa+REpdtBIg6yAGca83+pdKvvO1v3wZPpsoFglTG2lI9B5WJ/EpPSKAk+VwQ6i8vP
	Oo/TrggKyctojeiBGU0BEhXwIYzbO4hW2TQZkNqZrNUvnRKs6gNqufv+WJ2SeK7nr7LfGWUBAdfh+
	nBokQQ2KuPkUwIkXJnkxom3Kg3yNQsNpv4M4+zEKlaY6Ouvm2+9nOIjKuK9HLg/i7a6PCVjqiM5+F
	IreCuu15wIs9LMp4fgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBMF-0000000GwiH-0Akt;
	Thu, 18 Sep 2025 09:55:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBMD-0000000GwhJ-0P2G
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 09:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758189316; x=1789725316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VdrOjdmxeHHCeR4/FygVKubJGgZX78g1iZug45KwOkc=;
  b=CReal7RTI/rPis9u4FU8Sy+/9xLsh/3/9/ZKVkF9pt/a0HC1UdPY/IGM
   ytYBPvWXwuFVifU9o7tUINiOqfQm9ykrwLDZg2K84qQO6mKwEKlFrhlW2
   NV/4lY0pYbJe+z1mi0BC/j/6zpfWzJAjpEOkBvPLeq7iehfuSDCzjpFgo
   ML9zPHJaX6FNyFCpeHptfPq3nLIuwhig3xj6VN2YoBNSvo/yeXJfmiXTQ
   Jt2BxV5viwg+7YeoASITyOAPBRlje2jcY1SgA5+xldJo4KlDX3tpYv+5o
   HV2HWf97hBma6YJD6U5a/6D2khZspVNd4CfQIiYdgYa0s/UOFpUcHtzui
   w==;
X-CSE-ConnectionGUID: jSMfuw15TJGzquobHcasUg==
X-CSE-MsgGUID: 8joSnPNMRgSgNM3+xoGuZg==
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="46088878"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 02:55:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 02:54:35 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 02:54:31 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 0/4] Add microchip sama7d65 SoC I3C support
Date: Thu, 18 Sep 2025 15:24:25 +0530
Message-ID: <20250918095429.232710-1-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_025517_193801_354A231A 
X-CRM114-Status: GOOD (  11.49  )
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

Add support for microchip sama7d65 SoC I3C master only IP which is based on 
mipi-i3c-hci from synopsys implementing version 1.0 specification. The platform 
specific changes are integrated in the existing mipi-i3c-hci driver by introducing 
a quirk and SoC specific config option.

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Testing done:
With this patch we are able to fully configure the lsm6dso I3C slave
device. Unlike I2C, I hope there is no linux utility to check the
various transactions supported in the host controller. These features
will be tested later probably with I3C analyser KIT.

Durai Manickam KR (4):
  clk: at91: sama7d65: add peripheral clock for I3C
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC
  ARM: configs: at91: sama7: add sama7d65 i3c-hci
  ARM: dts: microchip: add I3C controller

 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 12 ++++++
 arch/arm/configs/sama7_defconfig              |  2 +
 drivers/clk/at91/sama7d65.c                   |  5 ++-
 drivers/i3c/master/mipi-i3c-hci/Makefile      |  3 +-
 drivers/i3c/master/mipi-i3c-hci/core.c        | 28 ++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h         | 12 ++++++
 .../i3c/master/mipi-i3c-hci/hci_quirks_mchp.c | 43 +++++++++++++++++++
 7 files changed, 102 insertions(+), 3 deletions(-)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
