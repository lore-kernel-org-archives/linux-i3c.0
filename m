Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41B9C54755
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLpiuacByu+yOO8rwnkT12QY7v+5/yDp51dNddT+2Xg=; b=cE1Q2L2IAxhj5B
	zTCg3ZNdBO2/UE/WUtRwNVxrO0RMJfJFSjS9MNvvnKitPyjSizpf6zY0GE/8MFhvLAnxUhqEawzwY
	aB8BfNG1+gjjnYZ4AtB5HbCCvzI3vJr7AU058/Pp0ODDJ8VsORUbzehFPClOe7LC/+5zmsTEdlIaE
	RO24Ow/uH9+Lmll7bO85c1q/ayCUZ3/OT9Ot8RJUKNqIDjXqp0fNzQHPyK9eGxUPLW91JpdS+AN0u
	TZIsLEdMAyvEHaDXvreFV4Zx7TZtPJg7l+nXFsv1JTB0MNqAZtSdHgQarcBWNBYwFeUMx/3zOb6LD
	rXoRCtRvrkz2u//aRS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUli-000000008dP-1Ap4;
	Thu, 15 May 2025 09:20:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4lL-00000008v40-1dFa
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 22:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3834629CA;
	Mon,  5 May 2025 22:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DC0C4CEEF;
	Mon,  5 May 2025 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485894;
	bh=LVkJi8mchCIWcADcYyvzANclyip1P0il3Yw/lKBvEI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bXkmY7az9lnR6fPwK9u0nyCTXfY59o2XGVwUWqz5LsjE9ues34hfQ/Bq89TayZWNd
	 ZyKirQ3ICvdNGG1wktI+hjVkeemUVlW3gC3BmRiwx8J7MfMVQZYxjo6tw1K3Vjjm/Q
	 YYHkcmtT+3RyJehSovC8dkUvX3HDzu6nCXdejYkFGwTme7AGCyuWc4OiOrioX4H4W5
	 PhFm5HtjvvjpSGCO368avmqs4pM/1rWxpsxbRBBwoNoT0eif5f9mTFJ7ABnLQcdkMd
	 a6tM3ArNoR09au+S+EVYwkQdCEglt9tfTj/rpBmWQqLMeYxuTeNm7c7pzOFbDvyU1n
	 GRtAlLJzupqcQ==
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
Subject: [PATCH AUTOSEL 6.6 052/294] i3c: master: svc: Fix missing STOP for master request
Date: Mon,  5 May 2025 18:52:32 -0400
Message-Id: <20250505225634.2688578-52-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index fa1f12a89158c..3cef3794f10d3 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -503,6 +503,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
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
