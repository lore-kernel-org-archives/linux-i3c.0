Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32500CA0FED
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Sep 2025 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbShYVJI0rF/evDdRGH6bTl8iys2T+xklNNaXcIUmIU=; b=ZEY8DVsySiRChI
	wjlPvgfpx89PsA4gC+h5AgpgiaSpgMWLcuCw1mitIhXE0K36Yz3I9PHrbSxIvO+7y4xkfYAnhUsRQ
	NmFUvSOK+cHWoBUQ3EH+tAx0CwBoVdhQdoiZ3c0T9TFBCPblRsA9aKFKR0ehwqzDpgFh+o6usjmIS
	SYhaKb72q4Y+MeANK8y9bZcIgrYaio5Qbeh6Obst9jNidJl2J8jAErWnJs9VcThb6fj7Y03M/jVS6
	AYjN39mqOB2JSZ8+0EyvEyVLUzOuNYpv+Y+ijX56FzTvuJxIyklNCOvUn519ky7W4a5vBfmK1ovzE
	juHnrsoWyPJQIyDlHJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0VE-00000008Dwu-3uOI;
	Tue, 09 Sep 2025 15:43:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwIz-00000006eQD-0vcO
	for linux-i3c@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EYniclvS37cKXgDCPW1A/nWW+upGqCcZlgz72AbirwQ=; b=UFggbOOAlwmwxXwvdmLGHUvrEy
	PoluHQSysbUUVbdhFt1Wpra+4nGn2y61cXK8TFN5CKKxpv3fDC8xO1NBCyT8ZnBWvNo0MzC3CXdrB
	wo/KSBCu0+TZ0qx7xWU5lsUKIsd0iMUhlW0U26g7jOdBYENtPPxf+Cg2fR33xhJ5301nAEwCqfPC+
	adqkJGpBOdN/sOEeZHYanty/WzOeq0ZyGNI50PDF36juHvD90sees+xFSv1HTVtrRXiWnqdW86MnF
	/lchW762CeVuzSlJlxpPZu9KgcKySeIkt4/hkOw3/htvw273bNTi57HDa0BWeogJ/gxt54ijzeuli
	trZ6lbQw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwIw-00000005IcP-0QkE
	for linux-i3c@lists.infradead.org;
	Tue, 09 Sep 2025 11:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757416470; x=1788952470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7GghpEowQgCsvoKvmInuAueony8J6u9Ch3KTu6VwCGo=;
  b=0tYaLm+uivcoED//ftRuCJYzRv33YGnvmhzZU6NTk53b+YHFXJYm3+fU
   MEaavfnYuEUUgER7GxsKz5kLwtaESC4XMwgE0wccL0Zm5/JtrbV4LWrV3
   OdQl6GM6hun42t4pmeM2kqlgjLXjd70qHWpraq9pjH4fCMuquK0baKRWR
   CK892jPDoLMjgcQ5HeIElzux7DEcAJv8JCCjOazMjVwmsdVSFTqSSXgi8
   PJTg06fTfYvn4Evt/XUTfxybmvgxw87guqrpplEFcZm04mBk351uFisg7
   +TKFXa6XuSPyLMsjb369d/kLDWHOSMTA25KjH/zegSsxCwynJFqBmySeJ
   g==;
X-CSE-ConnectionGUID: KpR6Q2SaR7yc9+MOnppr7w==
X-CSE-MsgGUID: J/JHUi5DQiGac6gIftNVlg==
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="46810497"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 04:14:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 04:14:06 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 9 Sep 2025 04:14:01 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
To: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <balamanikandan.gunasundar@microchip.com>,
	<nicolas.ferre@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH 3/4] ARM: configs: at91: sama7: Add SAMA7D65 I3C HCI master
Date: Tue, 9 Sep 2025 16:43:32 +0530
Message-ID: <20250909111333.170016-4-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909111333.170016-1-durai.manickamkr@microchip.com>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_121430_544131_81421014 
X-CRM114-Status: UNSURE (   7.59  )
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

Enable the configs needed for I3C framework and Microchip
SAMA7D65-I3C-HCI master driver.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index e14720a9a5ac..558ea3c461a6 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -115,6 +115,8 @@ CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_AT91=y
+CONFIG_I3C=y
+CONFIG_SAMA7D65_I3C_HCI_MASTER=y
 CONFIG_SPI=y
 CONFIG_SPI_ATMEL=y
 CONFIG_SPI_ATMEL_QUADSPI=y
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
