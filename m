Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3365BC982D0
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 19:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKq30NxYLXVECqCRp4oswgH1f9iBLI7QsNEJdhvz8sc=; b=1FBYohDZBgKDre
	avPtIICv4CNPsKhN0Kjs93zAW29KClmQD9kFmlDCAyO24LLsvQP4EGhg+H4lmn95H7ZbLohELLaZ8
	APdIDkniIHwH6ncJQsFFL/LEsUQ9TmRW3Gk7/56nMdyruYxQUPLPi3Nxx/yjm6O+I/rdIuHokqsJx
	G1+i/+xgWdMw/xxtajR5jMWtaEYh6uV0K4Gjkl132xJagXGdkdn+z+EqWVlzscHc6nXfFfQdwQB9P
	Lps05lPVwiPySUHDKMdwucf/nnrj8CP4qUH63hYKQ9ZanMaUotyYnSEtoBAdC3LEQXfcAuQuB1iwH
	HHU4JYVsT3Jvv7Q287Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYj-0000000CJIk-3hMV;
	Thu, 17 Sep 2026 19:14:13 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HYi-0000000CJFz-0pZd
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 19:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789672452; x=1821208452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z1Ysn0ALQpn96UsvNcVVXzDqe+f+3zOb78ZzcXMOS1k=;
  b=kzK2jgriI6kh+Fv7NEduJX2Oeefbx0GtTOft8J0eFKkWsC/kyRp63XzI
   7h/aAGT5Kz0HWOjYVzSq3CeTHTY3G7bt9ZDeSh98YUhF2xqNLacb2wniG
   TkoEfsVgJIQcMe1Ao3VdTtjqIwEXl4nJ8O2MreWq65JbJCjek8IRQ28k1
   og/+GD7Nfe3kRm3JmvJ9f3JBVn0WMkzMlXHu1d7UlWj0Jsv/at2D1Bnkp
   OkuOJkC7YB1TG8qKoTtrTsMgNbYKxMPA7HNQbb5eKvoyw6tz+VKPPV5vw
   a106/HYqZoBSVCbrUSV+loJNbg567YwSCiMS4vHQe3oLwu59dsUYiG425
   A==;
X-CSE-ConnectionGUID: g06aoNh3TpOuLETCLkqvfw==
X-CSE-MsgGUID: /JsD5fW5SkuXtQcYFYv3Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639876"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:12 -0700
X-CSE-ConnectionGUID: QYJWFAdjQpewkl8I74tQLw==
X-CSE-MsgGUID: J8n+oo17SiuEiPKQsSqLhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270271930"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:14:10 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
Date: Thu, 17 Sep 2026 22:13:42 +0300
Message-ID: <20260917191356.133242-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917191356.133242-1-adrian.hunter@intel.com>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121412_251359_27FB1F99 
X-CRM114-Status: GOOD (  10.31  )
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

intel_i3c_init() creates the pm_qos_latency_tolerance_us sysfs attribute
before probe calls pci_set_drvdata().  A userspace write to the attribute
can therefore invoke intel_ltr_set(), which uses pci_get_drvdata(),
before drvdata has been initialized.

Move pci_set_drvdata() before hci->info->init() so drvdata is available
before the sysfs attribute becomes accessible.

Fixes: 884a33131f2a ("i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank Li's Reviewed-by tag.


 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index ab595661db1e..af9595009b03 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -445,6 +445,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret < 0)
 		return ret;
 
+	pci_set_drvdata(pci, hci);
+
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
 	ret = hci->info->init ? hci->info->init(hci) : 0;
@@ -455,8 +457,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 	if (ret)
 		goto err_exit;
 
-	pci_set_drvdata(pci, hci);
-
 	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
 
 	return 0;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
