Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7352C3ABC9
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdwCpdhhcdO1kb+htCl6QPEBuNg3i0tr/Dj3Jdkbcy4=; b=mKbfQjDSKzSllt
	IkIqDaIS1CkRYk/2g8ak7L725VYBJRA1coVzbl25Bywk6gtiv+W2TBLLbLytA9nHDXab9I3cufsIG
	XBt/HiwA4b/q+s1lNXunkHfK98VwWRIC6DlrHxs6Z2bXs89n/CVIKj5d8hEjX97gUkBhGLrBAHsIP
	l7jjyr0UnWO3FStjTKYwgaznCFDdrbRMvuYksZmpOul4pIUbqSzUee48YmAA/t1ws+QeA7o+Mfh+C
	yvpXP/mhnSyahXo202GrKJiLohytOp66M/KdGKO9pvtunJvXf26A0xGfMhVmXO1h4Qp2D8mKIMFAU
	gPQYrz9QKkjlxiU8ew6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlf-000000008ZK-1fTh;
	Thu, 15 May 2025 09:20:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC49T-00000008iiM-3fxk
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 22:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 755D5629C6;
	Mon,  5 May 2025 22:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFCCC4CEF1;
	Mon,  5 May 2025 22:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483546;
	bh=SVbdHkmnEMzlpLXw6AXLevVh4v92tupfg6nDjZAGnNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r1OJrEj1rAilIPi/iDqiSxU/HwozY+CHD/LRS/sy1rQBfo1JLTIY7hwwikblUurnI
	 wm1GRYcxn+L78qX5TKgAUxUTm7XJ9bznbIbG0p9esKBbzTzcG4Kiw8u5xJ44898A3I
	 cyN9Q+TIo5Mpyjo53BHRcHXG/4m8De7swLgC2EDZLZ+clSR9z4rbOFf5ryNr9o+Asp
	 V10NPffIg0I7dkeMimheRANPHrLJ+eA4IRtWWBXiT2T/PAqqLGA0RhvwmxrrXocDbl
	 +uTE8tABw+jFutIDBc43Ft7F4FKQ8Jiux4zZJTy2Wi+vD5Quhj0ksoZaj1mLX0LvPd
	 agsdssnweneAw==
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
Subject: [PATCH AUTOSEL 6.14 108/642] i3c: master: svc: Fix missing STOP for master request
Date: Mon,  5 May 2025 18:05:24 -0400
Message-Id: <20250505221419.2672473-108-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index 0fc03bb5d0a6e..a18fe62962b0c 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -551,6 +551,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
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
