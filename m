Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699BFF8D766
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Apr 2026 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jt4Pplib+twsN9bgF1Wg3GsGyWGd0fw2sI7I0KOkHhc=; b=SMI+9NQVfeMNZD
	tVTQZNfdKESlGzfn4Rh6to75FIsTP+U46xXFfdsqMDxGpGjqAc3anFVNRwZL2zZvqkvqFytGvCNJP
	ibn6hZ5bxcahRTyN7TWH/vAZVFWE3BHrUzjVBQDJotOOt7auDfN0YKwhsGhksI0W+JGOmsRGxog94
	PYIGaS8k6KHzeE/5PTtOuI+3J7cZ+ir7PQYYHnnHqIbGcEjAnn6ho5oHLlc7oxZDLYvv1uTOwKFvN
	NSwDnFPKfqF4oozLkRTFMvDl+2ucqohfKqtoBGPbi+NUkySBXeC8sIQSUG0fysyYfvEn0S62nPPT+
	5b9WJBHxfdTmddycmmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxw-00000002jdz-0hNm;
	Thu, 16 Apr 2026 17:57:24 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQxs-00000002jc2-3qv1
	for linux-i3c@lists.infradead.org;
	Thu, 16 Apr 2026 17:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362240; x=1807898240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l9/XGCFmUNwQod5vP59DMBBLRtrS7gHKb+3bXhugszg=;
  b=YyKo4DHWAQY2Z9YBmQSuocB8Ol5HDhswS0i4PP0CXEFib8PM6BIjlm4v
   llx6ISzRLMEe+xQg7Uy0QSe1bKJ0GIYvmT6HjUMFalK/l1qCcw5GaWZ1f
   A8X05SqJmFFt7K5pH+DoRA+/u9b3VT8P4/XWF/p81ACNRqO6+vWM3Q8NA
   bwFzpywENMCQoNmHojU/lFYZOVtkcy6a6UdP4/1m/XzibQz/LY+MTqyQE
   rei7hvfbW8c0IhUUAga22EhGXcpA0jz0qldYp4brJecLBlB5IAyVTY1e5
   FR705fX5p2rK9R2o0TYsyDcpKRPNS/VnhZmVYMybK2X6E0UTQ/jPWWgTK
   Q==;
X-CSE-ConnectionGUID: 2VB46Nz1RUO3O+fuuQk1AA==
X-CSE-MsgGUID: YKHXbut0SV691unqDss6GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94778354"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94778354"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:19 -0700
X-CSE-ConnectionGUID: kIiwc/EaSDmzZmXvO31fow==
X-CSE-MsgGUID: QFePmp03S+iUz8tJOhaYog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="235784490"
Received: from abityuts-desk.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 10:57:18 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
Date: Thu, 16 Apr 2026 20:56:50 +0300
Message-ID: <20260416175704.41217-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416175704.41217-1-adrian.hunter@intel.com>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_105721_001352_10B5BBFD 
X-CRM114-Status: GOOD (  10.45  )
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

The MIPI I3C HCI specification does not require the DMA ring RUN bit
(RUN_STOP) to be cleared when issuing an ABORT.

Adjust the RING_CONTROL handling to set ABORT without clearing RUN_STOP,
bringing the driver into alignment with the specification.

According to the specification, that allows the DMA ring to continue to
receive IBIs, although currently ABORT is only used in an error path so
the change has very little effect in practice.

Fixes: b795e68bf3073 ("i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index e487ef52f6b4..4cd32e3afa7b 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -554,7 +554,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	if (ring_status & RING_STATUS_RUNNING) {
 		/* stop the ring */
 		reinit_completion(&rh->op_done);
-		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_ABORT);
+		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
 		wait_for_completion_timeout(&rh->op_done, HZ);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
