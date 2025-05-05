Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0CAC3ABDD
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFy3KMLUlgLB1JUJrSYG/Qt5jkbLSK5sO3U8ewL5hvk=; b=maQjr/7Y4lEL/y
	fsSW+SCg6aY6kkvVoA7Mh03bOyTH1ibYHan8Tr/nQ2bnYOF8oxlhTshzNik+JEFWzosNLS+nR12lJ
	FTGkJM+w+ke+FFmRaNvIAf332EbSTKAbmcnEd2FgKf52mJytknpjuSXWOKwilIipq2Yx/W95bp6JJ
	evrEwpVThtfw5uuEZs6ZPvEUo/lcZ0g6a7D4PuFCKsk6N3PSS34jyHw+HcHmVk+TKkYrjT1KEY8Ep
	ZhmPByBuztb8IMVUq3Xfix5ScJMSd6KBvHE/OzC4EcqgSv9yWcLRxSti6Eryx5vl2IDDyAT3M0ot8
	B6aU/lD7s1hAMPsa3Z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlg-000000008aX-0pIh;
	Thu, 15 May 2025 09:20:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4SH-00000008opl-2HnK
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 22:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 440FBA4CF98;
	Mon,  5 May 2025 22:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C900C4CEE4;
	Mon,  5 May 2025 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484712;
	bh=xzIqIZgerJnM3pWkDT5WnBHc7fyqGwyOl3LIJ3Oq8mI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YiGvS4EQ/y45WGtX6VQ/ploUhIU20XXDdG+i4Duby8/eFyX7Ih+8SuopylJzEtP0H
	 FAyxkJ8Q87Wp0SQRjEWz5zJjiQjdofOvwkv0pJTfkCRnpAgWyaXuF0BCREkODZDj40
	 Es69ll1tR1SS+L/VqSYBYJmG7PMav4OyeimLtn60oKN/7wyZW+VvZXWf9ipGWIqhXp
	 n9RrksOiMBrX8EQ01s/2kek0ag88q5NJSwazD9uSCYVWFIbZpdmXPxLIx5pIgAdnh1
	 AVObUYAw704ueYcVhniwsMnbSZU9hT1dDgyxyP+wGWXXDH1c5pZtnGIrd9HMq0MRat
	 cxCw2PxvzD4Tg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	yschu@nuvoton.com,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 622/642] i3c: master: svc: Fix implicit fallthrough in svc_i3c_master_ibi_work()
Date: Mon,  5 May 2025 18:13:58 -0400
Message-Id: <20250505221419.2672473-622-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153833_646201_84CC0C6A 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit e8d2d287e26d9bd9114cf258a123a6b70812442e ]

Clang warns (or errors with CONFIG_WERROR=y):

  drivers/i3c/master/svc-i3c-master.c:596:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
    596 |         default:
        |         ^
  drivers/i3c/master/svc-i3c-master.c:596:2: note: insert 'break;' to avoid fall-through
    596 |         default:
        |         ^
        |         break;
  1 error generated.

Clang is a little more pedantic than GCC, which does not warn when
falling through to a case that is just break or return. Clang's version
is more in line with the kernel's own stance in deprecated.rst, which
states that all switch/case blocks must end in either break,
fallthrough, continue, goto, or return. Add the missing break to silence
the warning.

Fixes: 0430bf9bc1ac ("i3c: master: svc: Fix missing STOP for master request")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20250319-i3c-fix-clang-fallthrough-v1-1-d8e02be1ef5c@kernel.org
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 2cf2c567f8931..75127b6c161f0 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -552,6 +552,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
 		svc_i3c_master_emit_stop(master);
+		break;
 	default:
 		break;
 	}
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
