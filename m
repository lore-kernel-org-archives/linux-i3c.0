Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D18C54755
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3KDVxZ576vyKNuWItWxuK9pi+fI7hcHZMrLLn43Dpg=; b=RR2X5QXYXM2m0l
	Obfcy9MFHaR2j7GQLi5CikwFg9TBaBQgChp6Nn9yH+ihikH2GoYKkM7xYcCCknqyxyHd0SXTEWRH0
	aqPzV35I3C1UZlXTklUdWpXVL8dXiky9eXEpI2WjXqhlqYZ4FiKfVMFASR9yYVLX8jCzPShx6hJsg
	8MLSPMtUig0IWdOz0rSTnEgoSbBeDaHILoMFWMUYOcrusFsVLwiFzcbY0uzb1zccY+JM4uKY8qPjr
	ZIh28WJhPOvApxiDgm6Uo2vMbC2X1vgX4c2D21gwMHvpb8no3gtK7J8PxXaSss81GtFvB07bG9VqF
	LTsgKnJjp6bPKj4x/DhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUll-000000008hG-0A7h;
	Thu, 15 May 2025 09:20:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC50s-00000008zRp-1OMj
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 23:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDF02629C8;
	Mon,  5 May 2025 23:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723C5C4CEED;
	Mon,  5 May 2025 23:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486857;
	bh=0EWvK4TsmZ4hBZAMOT+xfxdc3HMMgFzeks/y6hvpEGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QU/rqBrKUH6KumuPQzsv7iuz6wovWmMAiFAIrM9vfJO1CIXpjvpKGQen3S3pCLBOx
	 ahhooVH7vfei2Iy+Yh+SHBbLNZLgTU81f4uHZlDenC60L4QorwK1AJcZAslANCuyzG
	 PDAYHp7/1l0t96xzKGs2oZYxzDjfUAM2FUloThEmCI/t4ItzQ/HQiVE2E5nqV08z/3
	 5DqKBXBmmwAgqfNTsBtgyLXPzZh/SrKFlBXAE04Dh69qGPHQV9P7w91xEg5mwz4PZS
	 nCTbiyFfwSUqaHO2n6kllfkuJ/YF0i10LIrVF0sqtYJW88ftVuoodgEQu09KrvAkZ4
	 /JQwrl/8mFagg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stanley Chu <yschu@nuvoton.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 028/153] i3c: master: svc: Fix missing STOP for master request
Date: Mon,  5 May 2025 19:11:15 -0400
Message-Id: <20250505231320.2695319-28-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:27 -0700
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

From: Stanley Chu <yschu@nuvoton.com>

[ Upstream commit 0430bf9bc1ac068c8b8c540eb93e5751872efc51 ]

The controller driver nacked the master request but didn't emit a
STOP to end the transaction. The driver shall refuse the unsupported
requests and return the controller state to IDLE by emitting a STOP.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://lore.kernel.org/r/20250318053606.3087121-4-yschu@nuvoton.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 368429a34d600..92488ba5b5f2a 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -437,6 +437,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 		queue_work(master->base.wq, &master->hj_work);
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
+		svc_i3c_master_emit_stop(master);
 	default:
 		break;
 	}
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
