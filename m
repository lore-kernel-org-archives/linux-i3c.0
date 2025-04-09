Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96567C36002
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Apr 2025 14:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nvfAu4M2N9lOR+bNSC6utxWz8EtLlKQR+eG8IItfoo=; b=GsgcV3D73fJmDT
	uz5h0gvVtBPeXoSAHjIKp+zT/ZQou20XiMlECArN1JYT7Ro9esVV2Wl2HrTso3E/DCZmDL9XSAY5+
	XLzfKhk4l149FusvC8O3BzXaqQo0z+/7jqDGN81yYHiqF0n4LVY0nOrzw64CB1IhO1NKtOl7bl9iu
	8Hk0gzl4NXR50WtDk76EXlPDP0ScJ9L8xs3/aLSUTS87oQNWZclcJ5gDs4WWUgEh96Zk4p0YqByZE
	LklOF9REdCnQJVKM2k8djT7CnlIXRNIEBq+ojy5FP7yVis0LqHeeVDYHGnCGiQDDF6AXErmw8kzsi
	IMEY90YX/BTbJqHvXEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wcw-00000007VVS-1aak;
	Wed, 09 Apr 2025 14:42:06 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W2K-00000007Nyi-0FA6
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 14:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744207456; x=1775743456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7b/usqFQLj4ZUg2+D7KQLlVa+faLBGpL4jkarKC0leg=;
  b=ZBkAZ3fV7uDybV4Z5rYUEE5ZkPw4m9rA0MbEq+Y5yDAkmXZ4ACPo3pxe
   wQgychFg2LyQoBY4iuhH1jRjm07O2+FhX1BmeyECUuQivZO1ZatCvJOYF
   djWybmcQ7SwGmCEKmFcgvK/z6rAqAA7uMkjWniqBi7ZSjLHjmnvXsusMS
   8ae5pD46UrXnRgRQpbhjOQf5x3JUtGMeMbia6fG0q6nmyQHjbst5jEtOd
   cUrG+M3sIdnHsI8G2vbCLMImQTVASLqM5Yl2fPuTbx97apz+QbPTnScCx
   2/S9uXHs1IFaXcc+zSUSCEb/Y3evULM8iU2+42Vk5wiPEPHJ+kEF8yY59
   Q==;
X-CSE-ConnectionGUID: y5XWUrsYQ8+2LKLoOIGH4g==
X-CSE-MsgGUID: t/aLmRQfSXmpwBA2U1jweg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49531280"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="49531280"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:04:15 -0700
X-CSE-ConnectionGUID: VcS7vm+FQUWO+hvIR9TgjA==
X-CSE-MsgGUID: qbDvURWiTt2Ja+kvjKvU7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129116650"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 07:04:10 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 5/5] i3c: mipi-i3c-hci: Move unexpected INTR_STATUS print before IO handler
Date: Wed,  9 Apr 2025 17:04:01 +0300
Message-ID: <20250409140401.299251-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070416_104222_D2113043 
X-CRM114-Status: UNSURE (   9.23  )
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

Move "unexpected INTR_STATUS" error print before calling the IO handler
as it is more consistent that way. Otherwise it may be confusing if
generic interrupt related prints are mixed with IO handler prints.

Since this error print is more indication of missing code rather than
runtime error downgrade it to dev_warn_once().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: Added Reviewed-by
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 0bb74173ca94..bc4538694540 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -606,12 +606,13 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
 		val &= ~INTR_HC_INTERNAL_ERR;
 	}
 
+	if (val)
+		dev_warn_once(&hci->master.dev,
+			      "unexpected INTR_STATUS %#x\n", val);
+
 	if (hci->io->irq_handler(hci))
 		result = IRQ_HANDLED;
 
-	if (val)
-		dev_err(&hci->master.dev, "unexpected INTR_STATUS %#x\n", val);
-
 	return result;
 }
 
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
