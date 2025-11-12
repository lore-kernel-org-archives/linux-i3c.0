Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F979CCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 10:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pXN3SaGjQUNgO8nXJAFYtj0V0qDUCXDxTRMERp3MDA=; b=NrRf7yfM5S8jC6
	gYXUMbkg0Qt4Yg3p5Nz678qLp/X+vQa4OXynBFqGvGNBCx+K28b2AaX+HsghyCQ0CnKsEGwfryfM7
	Zg97zKh3VjTDef44ng5TPoFNgQS/lJSRXXCcRoz3upDa8M7kP/wSoxACVaFVSRVdoMhD30ZujfdDH
	dkOXXg3ltGZyRbr/LQ9GnKaHQLNR8keMwksmQT95gV9TniaS47UhuRgC5QL21hWRc+cu3mTrSKQ9z
	pI2c5u6z7qjmKAQ4E7PtSnvMO5OFZL6yHC9JaRO55qSaVbnuI8+Bmw/zsY02OMnUjSyrk6LIRQnP1
	3axmhnAI3E29V6hnKlWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7i5-00000008WYa-3udo;
	Wed, 12 Nov 2025 10:04:17 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7i3-00000008WKj-3haL
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 10:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762941856; x=1794477856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e+KSYL7/Eud3PRlAi3Dmw/LkkXq7A7cJoXtfl72Uy6s=;
  b=Td8sucesSdZm8NfZCw77pFLep95ODxG6AGKxDyyVsPdjzfQeY0ksfuSp
   Ha4XAMenAuK6+Ol6ZraivoIzrZra3NPMe5zdpxZEJ5TdAgNVluLEYaEX4
   5fWeocyrFs8j7ldHZlqTPMuBtEfDxFXAIIwwOAQVgZ7q12xes0Jsuuyzv
   jb9C/6TMPlmg10gcy7bENzrxSQ9os4kwnxK4W72HJQoL7CyylFAR0KV61
   2rK0FtZgBwOugync+/N4EMfPY3x1pvLbi0HxpGe/vc/6ysjaxxnOBMuE6
   9Eapf/FPEYaw4Gslw4zw91Pj9r7z5FO3slQytIq7d09fss8J09cv7TYju
   w==;
X-CSE-ConnectionGUID: 4HZ0mPP8S8WNrZb8LN6F6Q==
X-CSE-MsgGUID: YZFS7t2QSn6YSnCYUBqHJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75616263"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="75616263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:16 -0800
X-CSE-ConnectionGUID: JeB+cnPPTp2yEWR+J2k0JA==
X-CSE-MsgGUID: kZ7E/u2qRLWVwXoVRQl3lw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:04:14 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 13/13] i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
Date: Wed, 12 Nov 2025 12:03:39 +0200
Message-ID: <20251112100339.51726-14-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112100339.51726-1-adrian.hunter@intel.com>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020415_932517_4C6A9CB9 
X-CRM114-Status: UNSURE (   7.39  )
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

Set d3cold_delay to 0 for Intel controllers because a delay is not needed.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 1d76dc566ab6..72000d9a5fe5 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -181,6 +181,8 @@ static int intel_init(struct mipi_i3c_hci_pci *hci)
 	if (ret)
 		return ret;
 
+	hci->pci->d3cold_delay = 0;
+
 	hci->private = host;
 	host->priv = priv;
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
