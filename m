Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EB1C78857
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Sep 2024 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5Pd5jKmwCBhiKV+x0VvOOA/PkXdB4zGhQcPloo4vtg=; b=SZnoL7V1yHsEV3
	THYy9V42t4DxrZTOEbZ2Z4EC3w6SrGr2clEGAgLM+5p82Yxm0t+Zvh7831NYjomqO6ChcT3V1o9Fs
	l+FRpfMKWerlZtQRTk8fmuGfE0XexzKXMwNcRYQiK3GN3+D4IasrZ0yeR6HUjKzchtKZmBUTIG7RA
	ixQ2j3mrRctN7DYB8nBmsqSCB/aarY4Xh9R8ZwAxhXLh9WXnJ4WIkch00wMXHL4hL0Qom4Pw7ktGs
	rmLEYn/bQ/K6Z5MVUUGD7dwidL7d8lgh+Uli6BgISOWPpd63vGYNjKMU3+A9C7yKzz4/V3F/WwA66
	l6z6lB7oBST75KkbyuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sresH-0000000CPXi-2jD5;
	Fri, 20 Sep 2024 14:44:45 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sresF-0000000CPWP-1eIC
	for linux-i3c@lists.infradead.org;
	Fri, 20 Sep 2024 14:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726843483; x=1758379483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Op4I/fk/Hj/LLeTvEREWF+dg9gbrp4SgUO8J+WYXWWE=;
  b=UxkyqzZNq6rk6pBdgxv5mB7+v8Zc2/YP0RZF07xilJG7yJ3LfKcygova
   UQwLFkbZ1a+2x5AlIji6fHf6yRvdCCeLxwRIamP7sA6eUmUp2z6DMqw2P
   W0jjtjYYjx6zOFkuthp6PRgVVdTrJNxyRiK6TVn3ikNFLtXHPuRy6w7Nn
   8G6s5S5OSyiILSC2REFd9rLSlBI7woHMvV61yPgwIoXKZF8WPXqp26Wut
   yb7l8jYG3vIRdoYcBjrA2e8e9RST9CgEvS5sW61JXz4ZyIMGQxA1/S3ur
   EmiPs9er9fE67lFpGWvCUd3mv0kzHSnb1uCqL9HnoW3Oj8RpmCg8lCv+E
   Q==;
X-CSE-ConnectionGUID: lI3xhfGmSMWdxQJB6UG4sw==
X-CSE-MsgGUID: nfQZzeVFQIOeIRNtUQqjzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51271260"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="51271260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:44:39 -0700
X-CSE-ConnectionGUID: IHQBXfYxSjGWXPcPV9ccbg==
X-CSE-MsgGUID: BcHQ7wdOQ/eBZKzugo4aFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70751953"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 07:44:37 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/2] i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
Date: Fri, 20 Sep 2024 17:44:31 +0300
Message-ID: <20240920144432.62370-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
References: <20240920144432.62370-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_074443_465603_4C47437D 
X-CRM114-Status: GOOD (  11.13  )
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

Bus cleanup path in DMA mode may trigger a RING_OP_STAT interrupt when
the ring is being stopped. Depending on timing between ring stop request
completion, interrupt handler removal and code execution this may lead
to a NULL pointer dereference in hci_dma_irq_handler() if it gets to run
after the io_data pointer is set to NULL in hci_dma_cleanup().

Prevent this my masking the ring interrupts before ring stop request.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index a918e96b21fd..13adc5840094 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -159,10 +159,10 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
 	for (i = 0; i < rings->total; i++) {
 		rh = &rings->headers[i];
 
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
 		rh_reg_write(RING_CONTROL, 0);
 		rh_reg_write(CR_SETUP, 0);
 		rh_reg_write(IBI_SETUP, 0);
-		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
 
 		if (rh->xfer)
 			dma_free_coherent(&hci->master.dev,
-- 
2.45.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
