Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C89606A338
	for <linux-i3c@archiver.kernel.org>; Sat,  7 Nov 2026 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XpNyQETV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wq5T4S30
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KnRp2vmY01LdGEe3quddnuqmRSjL7zKPGLEw7t0PFHo=; b=XpNyQETV0zjI5tX103Y8gGqBnZ
	J1aqRjvzws55RO/F6FR1HMOCxArWUnIh964Y15JGhPsDcro1Sdn55aFQe+ZSGsQAa646JqepOPAVu
	BeiavDVIcANRoZ8sMSDzE4DAJ+jQQ+3nWt+YlT0KB8dfocn7PvHhGwS3HkFRWpcO/jdBxz6eXvYs0
	SoG+A4q+c36D2YqmDBF14ZK/bxM8PVEZ7p8xq1jtmiqncDLYqyzrkcPa58BnobdLaUrK5PHodNQuE
	YSjQqB1Q2pU483p857rRU/L+IYIDgMGH5t5pZ3XAxm+EfK68pGAF5Leu3trkEi+1UBtBr9tUvBkJG
	BuUNBYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeFy-0000000EaqU-0kCp;
	Sat, 07 Nov 2026 11:06:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeFw-0000000Eaps-1t9T
	for linux-i3c@lists.infradead.org;
	Sat, 07 Nov 2026 11:06:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A933160E25;
	Sat,  7 Nov 2026 11:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B291F008A3;
	Sat,  7 Nov 2026 11:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049603;
	bh=1+v5nmLjrqJBR/PKUpOfoPQLnK6X3HxkEctw6U+drJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Wq5T4S30UpSpwvuQh59bxL1zJAmSuXQEmxl/ArVLuVzGbDYwVCaYxvE0lsEJxdFMO
	 e4DCDQYn9KqtrBQiu6NRgol4R3kpKHtthsmmWNXPeyrm9kua5jdendRxZpjv8r8L5w
	 xEDhqs53nSVi/mD6tPDvMXGftMSoW/4FkbBfoQWTw4hN70IZJ/Fy+ADtkHEXfPMHX8
	 nglMAg48AksO2XWeq0EzjVAQmvC0mBbXFQPvqefBBB43MG/deLdi2brOiThnZZnNdm
	 nUhKmMpEYvXvCtSLlgQvtBAs3YMsjia8eOY5SGQMnQQ0fTP7SfzGUPHN3Cj4CrYGQ6
	 Z2bqdT+2Zgyvw==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 07 Nov 2026 12:06:24 +0100
Subject: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049597; l=1105;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=DDMIc1uwvysu3qnTyaeJadMRtcejbCASy1Da3RnYRNI=;
 b=xxWBeUmpR2bTiZvd10FdNRBOHwBqxXMhhjxi1zRW0jEmsCeaDiVFFWFiTO+9cj3/2yb/e5LbI
 NHekPi79kcuDSgzglKMLESiOhUgIT5c0tdw3V7Z4zPqNH0i3gBQ7HzY
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/i3c/master/svc-i3c-master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e700392f0801..9b845b2955be 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -2084,7 +2084,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	return 0;
 
 rpm_disable:
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
@@ -2101,7 +2100,6 @@ static void svc_i3c_master_remove(struct platform_device *pdev)
 
 	i3c_master_unregister(&master->base);
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
