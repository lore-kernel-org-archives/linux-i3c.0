Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFEECD343F
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhwHr3ITMA/IVaX/VBj8YGh0N6aAta9kDGecsYpRqEU=; b=M7FiEuNPd0c/cO
	t8CxvaDBf/JrQS2DehxzbJqKws4Hvb1oRsEyEIxW1/VBG1w/tsiGIntyLdZJUvgG3U9YjmcyvPF2b
	9o9XYsfBikOdBUD2lZP2HY5QiFTR0oMr3YmKftmWFWMUKFW91iaDZiYx15UlCGAvb7kwIBqsf0kEz
	tBpg6QqCeD74RHxYjwRFktlNY1aZntM05dXtRXkefM/oTWx0J40eVIf2SigGwxjkqpuwkzFgj9bq6
	AskUrOaypVRB4DuuXZUJvQfd7AMpgpI6dA6fq+Jqn53HfM+C36cMEX/bsnviUFqlD9Sw/md7EPPJS
	D7uX5/g96XPzQS1vu8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNI-00000008rUy-10Av;
	Fri, 15 May 2026 16:26:56 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvNF-00000008rJ2-1BjY
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862414; x=1810398414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FSUUfb0G+Gxwh81FaCHidOvdNJ83lqm7ZkEkFCNbAyg=;
  b=ZeMKGfaYcvqmSP05gqkyLCCG839XwNZIpBpfswFTUUIdC606qKwdhHdy
   YfbI7xp8q2BBZw4LtSeI3ouwk8VW9fu/M/f/2xBoDbvdLthY0LMNPerhc
   fd7hYQWrvFdffiSk9+EJiIo9ZjAYWHI9JLs7asgUqDlmSsGiZk8k2x+ux
   rZWM2ljoarUg5aDW1v8HpfoRMllDC9Wp4Wd1ruJjW1BU4LHuECIDw+tGk
   6kzfXj4Fs6zkfze62ia8jOjpTBBVQN41RSLKjH55oS10iZJhuguMvDFeZ
   q/6ygJt4vXptesto+pG9gRbJ2Suu60IXxriX9Su986kyOKsyZ05N0FHRW
   g==;
X-CSE-ConnectionGUID: jYWlBieMQ4KqaQNO3QdFyQ==
X-CSE-MsgGUID: bZflLUqKTn29mgbeIjvbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785278"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785278"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:53 -0700
X-CSE-ConnectionGUID: H6K3jIM7SwGuwslSecwHOw==
X-CSE-MsgGUID: zdIyBGnpSk+xXlsXw3CqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857244"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:52 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 10/17] i3c: mipi-i3c-hci: Factor out hci_dma_abort()
Date: Fri, 15 May 2026 19:26:14 +0300
Message-ID: <20260515162621.57719-11-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092653_387885_4D88A694 
X-CRM114-Status: UNSURE (   8.07  )
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

Factor out hci_dma_abort() from hci_dma_dequeue_xfer() in preparation
for further changes.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V4:

	New patch


 drivers/i3c/master/mipi-i3c-hci/dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 906de7dbfdb5..f2d33068b8df 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -597,6 +597,13 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
 	rh_reg_write(RING_OPERATION1, op1_val);
 }
 
+static void hci_dma_abort(struct hci_rh_data *rh)
+{
+	reinit_completion(&rh->op_done);
+	rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
+	wait_for_completion_timeout(&rh->op_done, HZ);
+}
+
 static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
 {
 	if (hci->enqueue_blocked) {
@@ -623,9 +630,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		hci->enqueue_blocked = true;
 		spin_unlock_irq(&hci->lock);
 		/* stop the ring */
-		reinit_completion(&rh->op_done);
-		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
-		wait_for_completion_timeout(&rh->op_done, HZ);
+		hci_dma_abort(rh);
 		spin_lock_irq(&hci->lock);
 		ring_status = rh_reg_read(RING_STATUS);
 		if (ring_status & RING_STATUS_RUNNING) {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
