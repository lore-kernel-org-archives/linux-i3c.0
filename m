Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F1DC2D0CD
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXgkXqsz87KleW3whng+9gnpWt16TFablHblE9/irzI=; b=w8Caujfn/Q2ke2
	FwAInYYoNlWSIndSZ10L4aNcscgjW5duZccwm3eVx+/qV+hBGGhOKsSQwJ45XnkUOd4VrDvzZ3vpg
	cLHGOdO3dGLo7QCJb8JcrBzNavsh9XJnTo5rllZViXs61974AEdPJd53GZoSzbOa0clcePYJ45bEo
	erchUottX9E4OfK8D7AMmetJZb7Kl+wTabavBxOcXQGo0ZnVL46UKdit/gYHNmkkgUavaPn7A99Sl
	hxP6xFBuamvgHATRSzHC4nqF9Ve2TpW8Rmo1nEOuz5WZHuENXRzGF0o+Ip3HfdOSe2QCIhheZbo9j
	G4L9dV6Q3qJY2OuEe+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlg-000000008bK-3QW3;
	Thu, 15 May 2025 09:20:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Vu-00000008pyS-2u0x
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 22:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC6D04A58E;
	Mon,  5 May 2025 22:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB4AC4CEE4;
	Mon,  5 May 2025 22:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484938;
	bh=6eFnS680vN2hlxIE2CQ2X6sg5pSvlbguIhhlCewL73M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ci1MNdUYyG4SJ4tx1WRa925jISAPdLyS3NhAeMuuBS4m8fmbSjJ2BXge+AIlNDHJn
	 QB+J2HGx4LXaNqGzfcXa3nKGq+qUA7R65r0L3TdJ2U3dvAtbNnfzxozu4Lptjnt3ay
	 q5wA0GZcH+1Ow6X2aOz/2prXXlb1PXCI4+mHZTzsHmifBO3H+6nyNwkr5sbxk1IC45
	 8sci5uw7tGOU3my2uqT799UP0E/m9hFjPGbxXizOgYOJEmTQ/S8mVmQFgiqV43aFIE
	 Xufqo5zxmf/CnrKMNfsOvUfuSex1kzWiLCT/ZdFFCwF6/og6cJOPZLaE8S+SLBWzCN
	 oz9qWdg9RplpA==
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
Subject: [PATCH AUTOSEL 6.12 085/486] i3c: master: svc: Fix missing STOP for master request
Date: Mon,  5 May 2025 18:32:41 -0400
Message-Id: <20250505223922.2682012-85-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154218_750472_16053B60 
X-CRM114-Status: UNSURE (   8.38  )
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
index 7911814ad82ac..6ffe022dbb5b4 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -511,6 +511,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
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
