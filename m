Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518CC7EE31
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Jun 2025 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hXzbUEZ7G+pHm9MkEOnmbUtVhSPovmozgviJzh2183Q=; b=pOyEsEnHgmrg+x
	9N2QDhcWBJvx0XLt05wXn2EH3TjITARzMtAS3jmF15oJT406r/vrukpb1fM0mvQqChg6tHo3PH8/n
	szuAiTGrQLqmSnop1vy0xARV1kPpJJOXZZBgRFE6XUQIfewQSmGc+ULfaFHb9XcfLAOepUdpsBWHv
	r3KhORL/jwh140pEOYWpn/elTtEzB7AgTNHbrFrkX/dZq0b9KeuypkazuOshxSBSI+AJZJiSwYNYx
	jKAvhhuUo0t/co4tk4oLXauWuFWwPxnVNUYKsJZs85HBt9A7CKuRq1Z2zfAtbYfPgK7wNAXxXQI8A
	g7cEE1vAHM9ak9ge9xzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8MF-0000000Ef78-3Fxo;
	Fri, 27 Jun 2025 12:39:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV75w-0000000ESCu-2GAC
	for linux-i3c@lists.infradead.org;
	Fri, 27 Jun 2025 11:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=92ohitJ95DsLOl
	FaNlsKGYTwxrhgaxccrLi2DdPtkvQ=; b=i8qefWdmmp+N59JDwcN50XHzoUg0Qz
	Sk5tfjewNQXfgim0dA9qIlm6RBBapwsxXQb/TJTpk3ufyrPGFpgQpqBNH4LZQYHx
	1o/LfknOjwL9ZzyDFcdvdrb4/Ll9yBxyKk1T/AtpV7mAbM5n8owt92a3ILstYLy6
	xs7a25AaRe4PXRns5+wp+CgNH4wpb6C66UScSjLPypwlStCG5egftp3JUrXhJDlN
	NgqURrUU3B3AaELndPtBZpgKcCxjqNbv8ZbMt9F1dPzFX+etI8k4cOtRt2UySiOj
	L4W+6SA3s6KD90xAMfjMJzGXu9QZwohmFLjuvj6vOEWj6pGbz3hGkYtw==
Received: (qmail 1443517 invoked from network); 27 Jun 2025 13:18:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 13:18:10 +0200
X-UD-Smtp-Session: l3s3148p1@jG9L1Ys4foMgAwDPXzuUAOCQSK0rM+sw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH v2 0/3] i3c: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Fri, 27 Jun 2025 13:17:55 +0200
Message-ID: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_041813_857749_5E5813F2 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
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

Changes since v1:

* updated commit message

This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
probably will get one. So, let's convert these error codes now, before
it will be forgotten in the future, and they could slip through to
applications.

This is based on 6.16-rc3 plus "[PATCH] i3c: don't fail if GETHDRCAP is
unsupported" which I sent earlier. During its development, the issue
became apparent. Automatically generated and build tested only.

Looking forward to comments.


Wolfram Sang (3):
  i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
  i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
  i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP

 drivers/i3c/master.c                 | 20 ++++++++++----------
 drivers/i3c/master/dw-i3c-master.c   |  8 ++++----
 drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
