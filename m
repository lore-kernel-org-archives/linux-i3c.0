Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A4CC5AC67
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Aug 2026 05:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xAQaNhY+vtf8P5F2xX02w9seRXZDD+nx4IEEHhGFGQI=; b=eoVeCLgNZVtkf8
	eUcqGk+nL/v5OzfzLqP0IDKneZDjfiJwZTUALHK3/h+HHAx2xcTbCRmySsFzSMyVQcMHKDjn6fEJn
	WR97GkoLYfv3dZRXIxbAOhCTzMOiIU3h1q1AI0shxlvjGVlI6qD+jSa0TcBjz7Vmn89T1X4GKwzyz
	bH88wZflANbWNbaXEixwv16K0mUxHzEipsXk5i/D5CxMXOrzyoh9d6HtoxWa+Woa74lUaSGhiSkK6
	KctZxXwAS7BlvgAzcgolx8A3Ul2WUd/x4tPkZv8rAezsPYnPoG7xgbBDC5ASk8On/Zf+psA4MPFhn
	w1n2T701TQF9gfirDVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNZv-0000000HNzK-0AAa;
	Thu, 13 Aug 2026 05:02:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNZu-0000000HNzE-0B8O
	for linux-i3c@lists.infradead.org;
	Thu, 13 Aug 2026 05:02:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F23664017E;
	Thu, 13 Aug 2026 05:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0621F000E9;
	Thu, 13 Aug 2026 05:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786597324;
	bh=L/pbQ3jfbdQ/RKl/et3t5XXmfOmsGKxschRjgxKHTVk=;
	h=From:To:Cc:Subject:Date;
	b=aZH46d0Ia13rkJHjqQHQjYhbfQvr4wcZeNd/qn2gomk6amfDqf1LyMS234DcIy0qj
	 kjtF4Dll0vEBykD6SPIzHjA57lPiBYz+e7mwBhS5pmtM2gm6EelKWdF7AUqQsbZvQD
	 uVYmYgKErGzQI0xlgR4eypwhQg21AFhqnNzN97bpAKoLu0GK18pZadzP0+1ZZ05cm9
	 b0jfFYeXcjnqdSo4Tz/eSNpzHB29HG46LUR/FOnsyO5nNonwtfdhMG1wHeHIdAUDGo
	 XgVDsCQ9kIYtbHa0agjKArqA1dZNbmg4x6k6z3LLF0bSpJgT+xRmMkP9+heF8nB1qR
	 mITDLt5vd1TNw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: dw: use COMMAND_PORT_TRANSFER_ARG instead of hardcoding
Date: Thu, 13 Aug 2026 12:42:25 +0800
Message-ID: <20260813044225.22237-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Use the well defined COMMAND_PORT_TRANSFER_ARG macro instead of
hardcoding '1'.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..6ba84a97765f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -876,7 +876,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		goto rpm_out;
 	}
 	cmd = &xfer->cmds[0];
-	cmd->cmd_hi = 0x1;
+	cmd->cmd_hi = COMMAND_PORT_TRANSFER_ARG;
 	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
 		      COMMAND_PORT_DEV_INDEX(pos) |
 		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
