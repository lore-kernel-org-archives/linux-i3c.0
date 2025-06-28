Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FD1C54ED1
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Jun 2025 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kc8L240076nbhCotFeV+qAluvS0kpzTmRbN77bFnMo4=; b=D4WFo8wmsBP7ej
	MCbLzNv76+DqaJoPgse7tex9kRlf6Sv5kzqSVaJRbrwvIf6DNf5pttCDYJ3XC53rbmDHvHIW8eR4u
	CKPiRaftQjFVNQE72BfyDOcxlYIXM5fMm8V8G4HTvXTP8iCd80T4afrVUvcQRVryYGijWmfPBsCzz
	NZgchSj/8aa/G1wFu/MNMVloL1DBFgeVshfKENSJ+rw5AhZaQ4iRqRjzdxdfsqbNkTUCRcmbkYza3
	lNf953oJyorza8XzWVEgwwlCGWy1Kiedz1oCOBfGZIs1XCJV9DmTVthHj+nZwQUiS4cm+Sfc66Vtn
	2bxXNXdhc4C9ZWVVT9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb6W-0000000HFFf-0rnL;
	Sat, 28 Jun 2025 19:20:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb6T-0000000HFF6-2jMq
	for linux-i3c@lists.infradead.org;
	Sat, 28 Jun 2025 19:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=rX23wz/SYUNw54
	bZGoh/2tSnXh1H/M5q2krRbd706sw=; b=L7AkFT0HM98cI4pWrwngdsHYFz9N2u
	Iv0s8H0z0OcLog9XBp0b4a6dAbS97voEU/OE8RK15U3WgdTd63jaUl8aSOaAjsBH
	Sc+fwLjHaWys+jcQB3pRc8l16zCooUxJNfZ48YmHaiMuoMEPw0rySGmXOtrsGM3y
	W3g0G6Tk4NCBh+EiuYsGp6xNtOP29hMsUpGNtG1IuRUZXEC7eusBveg8wq5u77IU
	v1lt2r1ahpcO1M1ngFTFSKF6RQAxO1uQRwBLkj9iY0JOGJXs2+zYH9VtvttZSA2i
	xnO6ADuK8QwPqgD5nwfi0c4gzd0R+LQS+tC6TG1O2/lou/+d4xiNUoLg==
Received: (qmail 1918934 invoked from network); 28 Jun 2025 21:20:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:20:43 +0200
X-UD-Smtp-Session: l3s3148p1@O1jasKY4LIQtnPBw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Subject: [PATCH v3 0/3] i3c: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Sat, 28 Jun 2025 21:20:27 +0200
Message-ID: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_122045_964736_0A57D6AD 
X-CRM114-Status: UNSURE (   5.53  )
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

Changes since v2:

* updated commit message again

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
