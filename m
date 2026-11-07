Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5EF606A33B
	for <linux-i3c@archiver.kernel.org>; Sat,  7 Nov 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uipl996k;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X04TXavF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KWd99IkEaeo/vGbTl/D8eY23Pmqo5i4xgwMNe/wLbqg=; b=Uipl996koJX8lJkqAp9F4/TYjb
	Hpkfk+8BWXW+EqkM5ANS/K4FQiQdeqV7K9pluYyRrDlalXS4aNG7+7NGIVBP2afhizM8UVi2RH+//
	0GUWgBQTk6bCsC0BaT0J1F/ho7QWowwZ8DkGsRjVqQ8AZEA/wM/fsdxeraRV8ESCtQxQttflUpxKq
	oxeeUxeql14ViUcvvNVeJGqxJSsSoLY2q7+/ypDKn4JMj1PJfRfGdp03QtTOd2dnj6rhTtw0gB02f
	HlO0CNGwV5PE8RCgnUZWo7MOhNwHzS0OwUo9PtbWMlP9ghWsBLaWtunWVYbgVjH5vuA5BcdKArZdt
	yiu1UPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeFt-0000000EapB-0CMq;
	Sat, 07 Nov 2026 11:06:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeFr-0000000Eap3-388u
	for linux-i3c@lists.infradead.org;
	Sat, 07 Nov 2026 11:06:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C350436D9;
	Sat,  7 Nov 2026 11:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8955C1F0089F;
	Sat,  7 Nov 2026 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049599;
	bh=KQl49JqDM1vCAeHiQOXEOxQSoBHDKUHAveCBwvlANlA=;
	h=From:Subject:Date:To:Cc;
	b=X04TXavF7DfzIIF4PvjjKGxVm6TqxF8osxc9KAtZgcGy4i3bvupWXzybPJgOU5vmK
	 v53xqJLdeQWRxW1Ts04hYQMJMGM9ohjRlCM9fHpHR0yXvf189QcAPbmAlLawolDTM6
	 LhIoPltEktEz9ytESttOQ49RfkTBpqvxfqTMugOS0WQ9YibMHCJeQo1C/fK36P1pmf
	 kUZKTkMnzCNeysukKqRrma2LhCHr5FenLgf7hRbq4enzNfLGLxUp9sPlLbAc3PJNOw
	 gxD2J5U9N5t5gEtQ/qmp+gbnpvYaiSKGKBCC3Z0x6vVERY4TKyBobpbvHH6rYeFpQR
	 J5rB+FBBgze/A==
From: Joshua Crofts <crofts@kernel.org>
Subject: [PATCH 0/2] i3c: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Date: Sat, 07 Nov 2026 12:06:22 +0100
Message-Id: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqFMAxA0a1IxgYaxQ9u5eFA0qiZtNLYhyDu3
 eLwDO69wSSpGEzVDUn+ahpDAdUV8L6ETVB9MTSu6YncgD6GE7MJLvmMlu2Q4FFbRu86pp5p5NF
 ByY8kq17f+jc/zwtJ/daUagAAAA==
X-Change-ID: 20261107-dont-use-autosuspend-i3c-d05c16c18c80
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049597; l=750;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=ouv8izIkvbhc6okskbPloVm4p8gofpB9GBqlgkpFX+A=;
 b=JmThoJuFTbbQpKSHqwSjBG2T9jNfHUlHPFJZ/czjYxWwMUNimU0pqVZkRGZ9AxlS0CJP1ekVF
 pmVECe9Dd+5Cp0dZA9N5Y50XpPWcyFMpxO1C80jBEo3QcEyUeDD4s6T
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
Joshua Crofts (2):
      i3c: dw: remove redundant pm_runtime_dont_use_autosuspend() calls
      i3c: master: svc: remove redundant pm_runtime_dont_use_autosuspend() calls

 drivers/i3c/master/dw-i3c-master.c  | 2 --
 drivers/i3c/master/svc-i3c-master.c | 2 --
 2 files changed, 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-dont-use-autosuspend-i3c-d05c16c18c80

Best regards,
-- 
Joshua Crofts


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
