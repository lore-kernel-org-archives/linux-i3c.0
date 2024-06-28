Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEB4C3065B
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 13:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1IWU75CxfVmHOsIY3S4yyorb+ZmELG29f4OzRjp5B0=; b=xyhJfWJVHpRJIv
	mq1PpukJQ5wUeuraUZTaG3GzkXNKq31+WQKmPzr7+2NBiDyaLCNzsNqJkUj4QB43p13noD1xwpgC2
	d7vOuQAWzunIQ5gsHfjA11WpEOcI2ZGfudSYeeD96+Y60CfJl0oLK9fl/MAB/ebJdq/ac5Z+IoLWq
	D6WHT9Ld64e5Mc0DRFRG5eTlI+ZMOsiaeqHOBw6bvVF5apUqvxhgj21lU4YEmjQcr6PYcWwE2tAnF
	Tm63sITwacZqQN6kYmY3JOJJ816d8BwBHg8c2xZAd7Y2d9wMDt6Kjz8eMBlW4fteXWFmZ0SwxItau
	XW7bhqYkatCNIbMtP8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTH-0000000DnSV-11Rm;
	Fri, 28 Jun 2024 13:16:59 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBTD-0000000DnPX-3EBT
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 13:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719580616; x=1751116616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z21wmrskk3ZtoTZKSZUQzAUxQFElN0J78z98EF392QM=;
  b=M9XD3ub460s+Fvdczl+q6MJtjC1z/fyjO6Ccs/LXpa2AV53OMZpIZQb1
   5yS3iC3GViKGvGx5yqH6muz1h1nGyJJeiArhE/B/d94cD2dnk0cC0+JFS
   VWG+jALvCN8RhjhL+p7M11NU0h8Yk+6MSiUbNMfxZ0PliL5G9+IndSmpe
   M74WfZpmbSssR/ERYAGsZa/kDUGtGNlPFUo6ydJTfOkkhyGP03Z+nTVy8
   kEssWiMsnuUxxwXBD58C6RLIqh7KglO/IBZlm+vgmSoVNs7xFYUYFwnws
   LNmUTYi1DGn8jGfK1ukAlpst0Sq9/PRGyXXW1iTItux/0iEKRbQrKZzQu
   g==;
X-CSE-ConnectionGUID: Ra3gplm1QvWz6gj+0AKfQw==
X-CSE-MsgGUID: Gg2RhDs0S2+m9Oez8kTWCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34300195"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34300195"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 06:16:53 -0700
X-CSE-ConnectionGUID: AnyF1SAYTUudS9NSVJHAWQ==
X-CSE-MsgGUID: j7PtHIWmRq2lFjY5eYQ9tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49213807"
Received: from ehlflashnuc2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.57])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2024 06:16:52 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 4/4] i3c: mipi-i3c-hci: Round IBI data chunk size to HW supported value
Date: Fri, 28 Jun 2024 16:15:59 +0300
Message-ID: <20240628131559.502822-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
References: <20240628131559.502822-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_061655_961060_975F2F30 
X-CRM114-Status: UNSURE (   8.68  )
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

The dma.c: hci_dma_init() sets the CHUNK_SIZE field in the IBI_SETUP
register incorrectly if the calculated ibi_chunk_sz is not exactly
2^(n+2) bytes, where n is 0..6.

Fix this by rounding the chunk size up to nearest 2^(n+2) bytes.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 9bdfe40bc1e1..a918e96b21fd 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -279,6 +279,13 @@ static int hci_dma_init(struct i3c_hci *hci)
 
 		rh->ibi_chunk_sz = dma_get_cache_alignment();
 		rh->ibi_chunk_sz *= IBI_CHUNK_CACHELINES;
+		/*
+		 * Round IBI data chunk size to number of bytes supported by
+		 * the HW. Chunk size can be 2^n number of DWORDs which is the
+		 * same as 2^(n+2) bytes, where n is 0..6.
+		 */
+		rh->ibi_chunk_sz = umax(4, rh->ibi_chunk_sz);
+		rh->ibi_chunk_sz = roundup_pow_of_two(rh->ibi_chunk_sz);
 		if (rh->ibi_chunk_sz > 256) {
 			ret = -EINVAL;
 			goto err_out;
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
