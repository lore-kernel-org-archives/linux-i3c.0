Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EE8C2D0CD
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EkV/OUx9A+wpisMIQXp65IkL0Ur8s7oq+Y8R6QGLDQ=; b=W88Kf+VDGLvDM+
	Yrn9lW5Oy2vmrQWtYbjKmrHEIg2VuhTVn/R/AlcU4kjsDF6h9tRWCgAdLi6HwraSgozVRFQIKtAmh
	IQGPycO2uKSV5N9eJOT6EGiAAkP8rudBr0JFoVU4xnukPPm6NhhbAd8oEXQ8wAF8YFresZTrCzH+z
	PjQ8dpIjOiJsIc6W6T+jVcS4aD9iNYFyd+XsgMWHF9VRNWyVuvZHa0vqmEOXq/y0nFG4oxYA/CW07
	OHrZ8ne5axLynpZJ4d1JeNqrcSgPuK9DcUr/fQPV9//JOyKCWNodStmd5P0/FG9Pn3V7bbJgYv1Zs
	kXjtNTya8bCKEyX4u72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlj-000000008f3-1SBS;
	Thu, 15 May 2025 09:20:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4uU-00000008xeB-3WKQ
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 23:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E0F25C00B3;
	Mon,  5 May 2025 23:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D973FC4CEEF;
	Mon,  5 May 2025 23:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486461;
	bh=jXEQ6PPjiMzyXTjS7YV05hzr62o6h6uD16Pq6S6UpHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlcW+Bl/AXSX6jjIl9lwtu0qzcMCYMHXS+515TS1weEoo2RMb0Vf+tJDJpbzUANoC
	 /o5mwAqhaINbrvKVfEzTqFylZW1N+f1HjrrBIfjE2BE1MZFlSfHog5nIVmMiycCtQc
	 c+6yTW4NjHwwGV8aZuDQwRtJkVBfpGZbz0I37B/TRMf+YEHMl9Hrsh5ua/dXAHF4uS
	 pFsq85ViKVF/wLzf511za8ieb9oKD8l1z0s3kUijmXaWpiUMNdQVcONr3ySgmvoACm
	 vHGqWuKCx23VvFrki2gmH7n4gMO+abHjD3vjWU2nrsw0NXCKKXu5GbppRmP67gzj/x
	 FPFUfgNeTkWCA==
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
Subject: [PATCH AUTOSEL 6.1 042/212] i3c: master: svc: Fix missing STOP for master request
Date: Mon,  5 May 2025 19:03:34 -0400
Message-Id: <20250505230624.2692522-42-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_160742_933298_E6A1E283 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
index 38095649ed276..cf0550c6e95f0 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -495,6 +495,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
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
