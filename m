Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C52606A32F
	for <linux-i3c@archiver.kernel.org>; Sat,  7 Nov 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WC3z6x4h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjIAgFWl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eOlGnOwdPxTTaIVw7nOeuT1yIe5MSp3JN7Q5JhIWdFc=; b=WC3z6x4hMKarVBt/iQhlImpMI5
	hmkV0rdpWv07mdrHsVXhgepZSS7sgsFF5XScoyHxrRYiRO9Ay4Pr2aShzwnLq/Ks/dSC3yyZfJaTc
	OpCbh10ikSa8+col+jUWZMKu4tx3gvLqFiOfCNQ8tH0fMtK7SJUGbVolwIVOmAc9dVSMQIEJSV/vK
	DG2TJrnxguggHiUfd/rs/tbN0Yw5fLVR3J2uB72fgFpDSdOxPYUAZfMDqQSvuuepPG5hvXOIjOoXe
	ksemyN+VWJyegYTU7nrjK+/8cuKrP8vY8jTBn5zw55fhqPGsKkKek/QW8+PwrfQG7jVytK+AoKKSZ
	EpWmp/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeFv-0000000EapT-0Nc8;
	Sat, 07 Nov 2026 11:06:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeFt-0000000EapH-2TcK
	for linux-i3c@lists.infradead.org;
	Sat, 07 Nov 2026 11:06:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C5B041E73;
	Sat,  7 Nov 2026 11:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65B61F008A2;
	Sat,  7 Nov 2026 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049601;
	bh=FjuJWkrZH0f/93HtgSWbOiGLuc0TDPxk1c11VoJaz0M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GjIAgFWlWLnzHy+ut+FAq7JUrjxdUNHEGHcNRb2duzcenpU9WuXz3kxzErhlxR/Xe
	 QXlAREly0RY7ON7zd4X71/FFtwvweecWd9FeYuW2jw1ZEvOw+YtzhP2zdc9NmRFenb
	 zkqXGEEih0ImoWQ86wtD4u4j0dg4wdCqbBroyLu/RWRS8rLWTkj8cf53N/B5FoM0fJ
	 vyJAtjXB1GmAUCidzbsHwYmzmz6foGD5qHNTXESRIGjeYDZe8uAx6wmDT2cW0ugYnn
	 jYArv0p8joPwuvMTinL/q5ZdtM5DCXlBpIVttCZX0M3OiaHPtY4XUWiPSub7A7Pn9r
	 cbLIF5jSMMoug==
From: Joshua Crofts <crofts@kernel.org>
Date: Sat, 07 Nov 2026 12:06:23 +0100
Subject: [PATCH 1/2] i3c: dw: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-dont-use-autosuspend-i3c-v1-1-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049597; l=1119;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=kJPnhzJo19aE0ih6RL6Z8/mQUEqLRIZ6NZeqzs1n7RY=;
 b=fg+YjkKNfzCzJp8Fi5fsdodD2ZNnI9z+W2/hrUGY05dpY1+XPTBCKsFfgoWJxUnnKkwJ5Yr8r
 kz7Q4YQgr3BBT8T+7gjaHMhDnWrVRxFMPeZBBaNTI93zMQ6g17GZo4B
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
 drivers/i3c/master/dw-i3c-master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d1119f203d1b..f8fed797e0e4 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1776,7 +1776,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -1792,7 +1791,6 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 
 	pm_runtime_disable(master->dev);
 	pm_runtime_set_suspended(master->dev);
-	pm_runtime_dont_use_autosuspend(master->dev);
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
 

-- 
2.56.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
