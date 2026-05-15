Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099B2CD4F25
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZ41qnH1pX4S5HDXk2T52HgOibtY8J4gpwPMVIKXVR8=; b=g+E8gwJjnUH3A8
	IF97nJRk+LZbFbQcDkQtUzTZT/DFMmI44/I/Rif+rIan6kk+5L0QY0Kuf19K46dDGs6iirJCVs+mT
	QJ/4VljvLO3BnMz7C2NB9isX6oPnMkfT9mVapi/xKz5rcmJ+zWFJ9hAikLbSTmzs6020nBu++PHNu
	vP/x1XqUjeibHYau31/aCJn1DIYbkUoB++HehY11IG1doCshVNsC6ZLQd2r6EdAmCFjtanZLjnK0V
	3eAcl3ldjE5qM8TnYnudfQvILtx2qKbbMYwZ7CxbZTaatujCBgLWlgu86RmUY0Xe4s5Bx1lLMY+bB
	WBJ9f7aDjIur1fZfznPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN5-00000008rL4-2sEV;
	Fri, 15 May 2026 16:26:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN1-00000008rJ2-3U22
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862400; x=1810398400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ObbOkCE44+r/FKwgeTpdAODaGKkmUlmyYBoR8+AOZxc=;
  b=JvXU+LvFEVzUl02rlbrK6dRf8ymGkTP/NmVzFPi4N5CYIhTkHNBrGavx
   Wdd1k4QhWqwft0yorqCFMvRtydJktO/KofpyNq8VsXltflTwwI8IlyHLa
   9cZIm3slV4nYnSalgZ6D7pv9cf+n/Hew236tZVOq4l9hJyfLtv018mr5p
   R1D5toQdMktsRtuUrlm0Ys0Vt/uQ612oeiBdrgANcrdkGFPghhp2gxJUE
   ue/Yh47g8OXpXB9MIcTyw1mgPwJ5Yp7QhJjEgknvEwqMtk1bxUYe1dYuY
   8KOJttFxl75ux8oHImpADPjZFNYxhxoYLuRk9qIzkvMQSRS4DU7sj+0WU
   A==;
X-CSE-ConnectionGUID: 0aLwrsAMTyyNrhjfYMPTOg==
X-CSE-MsgGUID: 1lQ8tJriTWeYVS3EDpZ8Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785226"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785226"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:38 -0700
X-CSE-ConnectionGUID: SdgyzqifTAuRnXcUrmaF3A==
X-CSE-MsgGUID: O/1n+4/zSsq1QcCfWUlxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857133"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:36 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 02/17] i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
Date: Fri, 15 May 2026 19:26:06 +0300
Message-ID: <20260515162621.57719-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092639_915645_CBF0EE3D 
X-CRM114-Status: GOOD (  12.44  )
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
(RUN_STOP) to be cleared when issuing an ABORT.  That allows the DMA ring
to continue to receive IBIs, although an IBI is anyway not lost because it
can be received once the ring restarts if the I3C device has not given up.
Note, currently ABORT is only used on a timeout error path so the change
has very little effect in practice.  In the more common case of a transfer
error, the ring (bundle) operation is halted by the controller anyway.

Adjust the RING_CONTROL handling to set ABORT without clearing RUN_STOP,
bringing the driver into alignment with the specification.

Fixes: b795e68bf3073 ("i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---

Changes in V4:

	None

Changes in V3:

	Add Frank's rev'd-by

Changes in V2:

	Improve commit message


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index e4daaa612055..bdffdd8b8923 100644
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
