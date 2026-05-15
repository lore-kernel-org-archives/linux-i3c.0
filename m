Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2EACD343F
	for <linux-i3c@archiver.kernel.org>; Fri, 15 May 2026 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoyChlNd4ssPCgObza9D/SpAwKNHctud1r3rPpTqbP4=; b=kFQG+XYNn+ZsTB
	suzjnaP/gKh86aUyZQjESZon3Tvw0q1kdP1Ot0b10aDB1iyg1QjlQJWnKIGoxTgtgW1M29YZCNadv
	YOch8k0erTclIrrBOo7W7mAJbMTKL7MmJBu1yP6KPP+7KP6dBgTj/zN5Ny6yz4cliv7icR5BEKXTU
	hLgBAYmq3GzkCoHrDlgpYesEMMYGPrYnx0u0boPgU726FhnHHPLqx9t6urysqm1d0nDewEkBuO8I/
	58GRz2Yau98TzINDn0IJ1o714qW6bOhMVQdH03B9xaP6G6OZfaNFoL+NmN10M3/lHFH3RESgVEcCR
	IsXRO6XajQYgKBlSaI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN5-00000008rLY-3hRP;
	Fri, 15 May 2026 16:26:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvN3-00000008rJ2-2IoM
	for linux-i3c@lists.infradead.org;
	Fri, 15 May 2026 16:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862402; x=1810398402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dVCJ05IA2LC6vrTUR77jZ+SF61lBLGgMfwXzmINuLFk=;
  b=J6tf+4U/u4tiZgoU9t1j158+lVEUrJrqhDlssA0NG4PLA7Fg0WKCaaE8
   yOwgikEFgw231WUM5Y7WfHB4dKiWdS4deydthrO36EnJ77bVBI6SouUzH
   kOkTlFzEFaP61lwl+AI1bevgg6DJ7GgUrNK9ho7/gTY8bRn344azI/j6z
   7IdVvyZLMvrxq72io46aQXMkt0SRto+dJ9lUWuZf2hc19ONbr/v8co4k+
   1f3qI2V4r0C+SIphhJoUhB4hTiQnI4j9k/QUJRvG9I5VTJQ6LapQFa8ZP
   c2C1gUzO+2jZuEaIp6CUuHgwY8oPVOOAdVxyxzHh3eUIdZLaG+1P7CTXL
   Q==;
X-CSE-ConnectionGUID: cw1lw1C9QfOjRfnT8hl/+A==
X-CSE-MsgGUID: /Scwn4bOTjOX3gvlopxzzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79785238"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79785238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:42 -0700
X-CSE-ConnectionGUID: oHWmFItpSp6mp+xABDAUWw==
X-CSE-MsgGUID: 1IJrWLIbT+up4aUd90OynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238857167"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:26:40 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 04/17] i3c: mipi-i3c-hci: Wait for DMA ring restart to complete
Date: Fri, 15 May 2026 19:26:08 +0300
Message-ID: <20260515162621.57719-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515162621.57719-1-adrian.hunter@intel.com>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092641_635210_B1BF13F7 
X-CRM114-Status: UNSURE (   9.11  )
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

Although hci_dma_dequeue_xfer() is serialized against itself via
control_mutex, this does not guarantee that a DMA ring restart
triggered by a previous invocation has fully completed.

When the function is called again in rapid succession, the DMA ring may
still be transitioning back to the running state, which may confound or
disrupt further state changes.

Address this by waiting for the DMA ring restart to complete before
continuing.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V4:

	Add Frank's Rev'd-by

Changes in V2 and V3:

	None


 drivers/i3c/master/mipi-i3c-hci/dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index c3da6eab8eae..3b14bc87bdf6 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -617,6 +617,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 	}
 
 	/* restart the ring */
+	reinit_completion(&rh->op_done);
 	mipi_i3c_hci_resume(hci);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
 	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
@@ -625,6 +626,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 
 	spin_unlock_irq(&hci->lock);
 
+	wait_for_completion_timeout(&rh->op_done, HZ);
+
 	return did_unqueue;
 }
 
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
