Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D061CCD495A
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTjb+P4z6ZcvQDCDssS+hgWnOWnPxK3Jr1JcKGQBIDg=; b=w4TYY3FI76wjwm
	0/kS9zZHmNdzRAdO7feI5ueMn29i4ByuBlIa5TIpKYLgHMdkOGDvOD4ByyurePid35xtA2qlMBgii
	/WqPfQLEGdrWKviz+T09+4dDv5O5Ju8ktzHUVxkgY8x1suHO/TT/xoHmh038Ri89lS/8ZqYMQU/qW
	GoyvnmbekrB3QbrG8x+yCjkkgSm2icoLbxiQVC0H9eEgevXTRX9x1nHc54UvoKPtS9y+BSPtojbKj
	2NGelwctz76GbPOHWikxS+BQMTKpcuNJ6d+LZcmYM1vLxpXlK9TdbKe5gF7Rr/MoYO2inZ+Qthqy8
	6qCcm33FHD6jWxS0lZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChW-005DtV-1O;
	Thu, 21 Sep 2023 05:58:10 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChT-005Dq5-26
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275887; x=1726811887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aan0m4dvxCeGfdoUNPICCR2zLhKGXEacwX5sFFmGqY4=;
  b=SMKG6gxgc9KaAK2vWivZyVgHs0SlMbrVn7FKIxv6+tqy0NYBGvkkNfkN
   ang1ZHXijW7Qt7k+v+y9cF9zTJ12W+Vuk11py4mQrTMTO1zuDMJF4QNoR
   6G2Pnu3NY1EzxCn0gRVkRQsJrnFREzEePXkMk6WmXmPjl97h3k1U11BzD
   g7mlL5Cx8L2QEl/HtkeFxgEbmXx4gHfrOktwMBTYlEu+mL++t2YZq8v0r
   o0Rh0j61OTbMpDo/N1alkE3RwfNUF9TuUGZ5g62SZ1bLcfZWJnmdeliER
   H2VUJho229vxO6CCfBrQ1YHNv+Xo+yiK8ziILdR9bsgT44RUBw9qF51lc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678487"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678487"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771259"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771259"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:57:58 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 04/12] i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler
Date: Thu, 21 Sep 2023 08:56:56 +0300
Message-Id: <20230921055704.1087277-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225807_719978_819F49F6 
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

Do not loop over ring headers in hci_dma_irq_handler() that are not
allocated and enabled in hci_dma_init(). Otherwise out of bounds access
will occur from rings->headers[i] access when i >= number of allocated
ring headers.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 2990ac9eaade..71b5dbe45c45 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -734,7 +734,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci, unsigned int mask)
 	unsigned int i;
 	bool handled = false;
 
-	for (i = 0; mask && i < 8; i++) {
+	for (i = 0; mask && i < rings->total; i++) {
 		struct hci_rh_data *rh;
 		u32 status;
 
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
