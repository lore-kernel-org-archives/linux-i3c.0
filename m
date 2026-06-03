Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E847CD6E64
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaKydcbxlMKyZVZTfYh7IWBO1pSeobAR+R/h3d+iip0=; b=sAUCJsMm+/Y6AM
	Ptbo+wrHfUB4Ugmp84nY2iYm69/fV+hyUqJtB5pBSb6J97U6Q0sJIQYpz47j9mco53AbY+7BRxN2I
	8el+6lMvMb8f+m6XaciB6Kse3UsIEz+mP01bUTwG6i7su94FK8soO7/dqqoJp9dzVg1vjWJTEWZqm
	6u6ifLPGjKXpdVnDsVHmBYArE5dj/ek782HmdS+BHIoHA3qrGmU2IboB0jo/kLlpSdz/oDrWwh+bP
	4A3xp2umu8B/h6abWL1b0GVHisCkEtUgTBBgiDcKndPTR1pQdF9A+BPJuB9El7hzisg2nx6b065yz
	0I0OukMAGALDLelz6xYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaD-0000000Efgq-0gzX;
	Wed, 03 Jun 2026 09:08:17 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhaA-0000000Effy-48Lk
	for linux-i3c@lists.infradead.org;
	Wed, 03 Jun 2026 09:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477695; x=1812013695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KP3kMxkM4Qaxsw8Trwrd+QR1CMRx14o7NA48dVHMewg=;
  b=jK2BGMUQ8QK44gDSaw7tQOme66G7ok5oVow31o6DokC5tWLmFr2LEhzm
   tkKU7r0q8n28Xqu2N3/ElN9rdgdsNAQw5OTAjead1KhenSxnk/Pcq1LzL
   kTxD/RXngm2VRnp760elEbL1Hg05XnL4Em8KvEu7nS16/SQ30zpfa6O7F
   Txwy6QduTlGBNby1Ozz3m6AhtixDVS86vrFtLmxb2uNscBWNoCzGRy41t
   MAphTJxmnzgdX/c5ttA9j5PALwxmf1UkJDrbkYdhJ9I/sU3Q3o13fqE6N
   yuC3HF8tnbpRGOgsnJV5urxfHm2kCz+JRwUj5p61kmmf++eLjkz8Z77hm
   Q==;
X-CSE-ConnectionGUID: NH/tobR2RBaG1d5Vd9pzRg==
X-CSE-MsgGUID: mYSFzLmrSQqMI0rISW3esQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91852598"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91852598"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:14 -0700
X-CSE-ConnectionGUID: B2lNsuIjSq6jtIDv6QcHGg==
X-CSE-MsgGUID: O95FU69RSf+Qw4BpFVm/MA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:08:12 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 02/17] i3c: mipi-i3c-hci: Preserve RUN bit when aborting DMA ring
Date: Wed,  3 Jun 2026 12:07:39 +0300
Message-ID: <20260603090754.16252-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260603090754.16252-1-adrian.hunter@intel.com>
References: <20260603090754.16252-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_020815_042064_0FA4B97A 
X-CRM114-Status: GOOD (  12.54  )
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

Changes in V4 and V5:

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
