Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D5AC87FCB
	for <linux-i3c@archiver.kernel.org>; Sun,  3 Aug 2025 21:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VZFMeOFcNHqNOd3uy8UU6kK8qVwhlEM1w+yr26n+JWI=; b=2Pz3GHc5j9yHw7
	un62jSsROKnyPEIWQ+95IJub5j2US2uKx5jU/kCLwincWvmO6gnCKlNwN3bnh36veZ/q1gCrVOSgH
	2QBHSoY4HdEVntV3YW2rOQVH3JzrODDqzTN44VSWpHzIdglfJNp9bZb3pj+eFDrS7PU/4V+6dqKdd
	3g+O4vHh4ZzdkTLCvFqq+rCySNwPbUBcMXfPzSpk3f1UTl5pzAuifIIZZ5wDV/K8NZgZqzlNMX/Ok
	XmL5ayZCmo+SV87gEtZuXixBlNFihI1588xU7VVyzuKUPSVnKbg9fIr3S6yA/wn8v3HV0J0kAPteR
	5gEnP5zNuQSTcQi8yAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uig14-000000098px-2INZ;
	Sun, 03 Aug 2025 21:13:14 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uig12-000000098pW-2Iq8
	for linux-i3c@lists.infradead.org;
	Sun, 03 Aug 2025 21:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=IMz6qALhfrcjJq
	J5FJBc1SrL8IelYDvgWwujMn3maHk=; b=jLGCNK/1kIggt0ya/OigdWnMD6UhU6
	GsCENvy3TCIPn+ITsFO0qTeOLiuQoMooH4N6gpjP5zgDuLWRowK0NFv9Z+j1w9eh
	vFx7StWDIuamd8KQ13IywfnMKyGnq4sN89tr6pjmubglEKEa43G5T4zje2a1HnDM
	pS1HCqPJk+j5EuB1wBfbL/NU3I6xW+Elkls/RXG4Z7I9Rx7dlKEdgbmTRJ43WqYD
	X7WAKNZSKyn4JkmMvKs3dTPlb40i08/j/FfuLupN1BtlbzZt6QwtiBN500QjYa6f
	y3HAsIW/56wFm+CXs/24kCcwvuG/6Kj2t37dmYuFUzBa97uQ1meO8lEw==
Received: (qmail 1653775 invoked from network); 3 Aug 2025 23:13:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 23:13:10 +0200
X-UD-Smtp-Session: l3s3148p1@bupMdXw7dIcujntd
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: renesas: Simplify return statement in 'renesas_i3c_daa'
Date: Sun,  3 Aug 2025 23:12:57 +0200
Message-ID: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_141312_864000_45A66643 
X-CRM114-Status: UNSURE (   9.84  )
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

There was already a bail out for 'ret < 0', so we can always return
success at the end of the function.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aIyzJ7HOENL1qp1l@stanley.mountain
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 174d3dc5d276..275f7b924288 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -679,7 +679,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
 	}
 
-	return ret < 0 ? ret : 0;
+	return 0;
 }
 
 static bool renesas_i3c_supports_ccc_cmd(struct i3c_master_controller *m,
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
