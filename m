Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C9EF94CA0
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdTcuk6k5YDxwBvIwNCVBt7h8A06fkI3ezGOF3ZatRI=; b=DZmk4Vl3fEGtKv
	EdOdaRIDTXvuq9xby+QiuUW8fuXZrB03xd5UsM/PqObahyN99YLyWatQeWcZtTo1jt+W1MRr3BK9m
	OBIjauct144vsLsfOxy/Vv7oLnM/6NEJGMaVFZFPeLHm7ypO68WPVi6emt/gT1Is7e5IQzQtxlgcm
	YKAdLo9pWphHoJM4CIsSV7Ygs8BTEwCbKAjnoEXFvRBtqMxT6ofysqt3mhm8NGFrcQ+dI+vZqedDA
	m9uaukAfdI4zpvF2I0fm+lB9UxcW3bE5NGVMn7rP9liHpPtu4LZ3kR28P/Urc708zHMVESW8f9VtB
	qpFMJEYPYxioKanlX1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJO-00000008zYU-12Wj;
	Tue, 21 Apr 2026 17:55:02 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFJK-00000008zV1-3VlF
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 17:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776794099; x=1808330099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AaxgiiGmOiywL9vJFkC5KdR4eVTrfYhiTvYULl2SqPg=;
  b=j/8OmOLYyunwTbRQxbpxGwmDXGQ0odrdlizB+cVsX+QHZDb8FpYUxdKi
   bwuxXcdMx+wbqWMZo6GgE48FU/K8MXbsQdk6tJKrXfncd1yn7wq49Q7wJ
   2W6HtFhDtPBsMujm2+lFX0gVuLtfadiDgP+c76k2PhC/QfQghK51YXfmA
   hL8E6rP158J15RyQVAbYSFmK0oQSNuYujza/bh8eaDRtuCj9NU73qS3Jz
   EEUVzr8u3Ax8zpGEi9wQKEYmUGnmjM/wy2rR64COiWeDbxiFfEWcNvxyn
   jsoEubOxwcxbYXUiQDPwls+IHrUiCo5U+LDYpSnOmj0ETAjXyP/skVxb/
   g==;
X-CSE-ConnectionGUID: ixOjnAISTSaVK7OoCxoY6g==
X-CSE-MsgGUID: Kkln4mrLRYOrDVHCnmTgGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77651376"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77651376"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:58 -0700
X-CSE-ConnectionGUID: hVEroJP+QnqTXdl/R4eXnA==
X-CSE-MsgGUID: eRUE9LNcRa+w1z78zwO/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227494907"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 10:54:57 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/16] i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from dequeue path
Date: Tue, 21 Apr 2026 20:54:25 +0300
Message-ID: <20260421175435.122094-7-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421175435.122094-1-adrian.hunter@intel.com>
References: <20260421175435.122094-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_105458_925642_44FE291D 
X-CRM114-Status: UNSURE (   9.19  )
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

hci_dma_dequeue_xfer() relies on state normally updated by the DMA
interrupt handler.  Ensure that state is current by explicitly invoking
hci_dma_xfer_done() from the dequeue path.

This handles cases where the interrupt handler has not (yet) run.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Added Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index c9852b85d6b0..28e4d38f55d3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -635,6 +635,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
 		}
 	}
 
+	hci_dma_xfer_done(hci, rh);
+
 	for (i = 0; i < n; i++) {
 		struct hci_xfer *xfer = xfer_list + i;
 		int idx = xfer->ring_entry;
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
