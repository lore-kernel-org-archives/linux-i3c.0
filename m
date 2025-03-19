Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F28C28B30
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Mar 2025 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RNrZlw0JcQNoJwNkYWGt6mEa+va/xrF1JLhXuoMQ7e8=; b=CAw6iJw7vCaFFF
	+2+3wSwoOu1l2dxrarCt0qMuyCY7Xb5ZEbTycr3gkFodowv5i/A2gumqtHQgRezpPAupUvUi91Fjj
	VfY0CF6kVnAHZ6UJ7j69ollr+Bs6cHAzz+dgtNI1yot2uy5rWIoSexnEZ+MwY9yk3kz1AF2q6guER
	AoHlqKj8nGCQqK81vIjbMc0TDJ6cAICbishtmcOBybBAIvIV/Bb6oJWRd0mOHQkr0GymekK7tZP+T
	PU2bjXG3+gcTpB6yB/irsqPfoC4kOGdx0NxKzogd/zDvPxSI0veyYPcjg2fqey5GSV0zX5dxltS5x
	7RcaHJp4Hbn87hM9WFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNuv-0000000DIgZ-10q7;
	Thu, 20 Mar 2025 21:59:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvxl-00000009Uib-07TD
	for linux-i3c@lists.infradead.org;
	Wed, 19 Mar 2025 16:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE9CC68152;
	Wed, 19 Mar 2025 16:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B063C4CEE8;
	Wed, 19 Mar 2025 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742400491;
	bh=ZgQibqnYOqFsCMWXhLzNKeBk1b2KjH8VJddDDteh1cI=;
	h=From:Date:Subject:To:Cc:From;
	b=V7hn4knWJ6YXhzBccFogxrOttg65IlcaiZtOT4Q332gBSwu6eDswCj8ymLjyfweNN
	 fZiFjKzpmAVxH+e6/gc1/6cqONePhrRpSmLvQOmUUsMoi81OIyMlDydNzKiRVqyTvm
	 4kQuPTZXEBPBuLsM8Bhc54P5sh9fPjS40uSVY79YeFC7uARceDqmu/NZrcGWWdfLF3
	 HYFtZp3zNXQK8z20NnYXrvfXa3F8GpGwNbyuJ0GH/mBjIwCcRdBCGJ3snCWujK3A5I
	 V0kQvTbNLWv0bSAhaGPOffNqFSD8SYrWr0IM++c+CU7hXlEbPi3uJPAFijRVEqXz8a
	 rKfo7h8KWvJtw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 19 Mar 2025 09:08:01 -0700
Subject: [PATCH] i3c: master: svc: Fix implicit fallthrough in
 svc_i3c_master_ibi_work()
MIME-Version: 1.0
Message-Id: <20250319-i3c-fix-clang-fallthrough-v1-1-d8e02be1ef5c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAODr2mcC/x2MSwqAMAwFryJZG/BDKfUq4kJi2gaKSqsiiHc3u
 BzevHmgcBYuMFQPZL6kyLYqtHUFFOc1MMqiDF3TmaZvHUpP6OVGSrqin1M6Yt7OENF5Q5a8Yes
 c6H/PrOLfHqf3/QCnyO4qawAAAA==
X-Change-ID: 20250319-i3c-fix-clang-fallthrough-9f5c7cf5e799
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stanley Chu <yschu@nuvoton.com>, linux-i3c@lists.infradead.org, 
 imx@lists.linux.dev, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZgQibqnYOqFsCMWXhLzNKeBk1b2KjH8VJddDDteh1cI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOm3Xr/UcwnsnaaTeu/iZ+s1S65X16vqNQasCJwSI2v7Q
 0+zRSSto5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkXZ2RYcLcHRt+pF05Uhb3
 UNAmTM65y+P/XvkosfjtBuLP1J5kzWFkWFD0ccYyqVtTyy5OUOyqdOyV+dJ/lPP+gikK5rHSVw1
 EGQE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Mailman-Approved-At: Thu, 20 Mar 2025 14:59:08 -0700
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
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e0cd3ce28b7f..85e16de208d3 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -593,6 +593,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
 		svc_i3c_master_emit_stop(master);
+		break;
 	default:
 		break;
 	}

---
base-commit: 0430bf9bc1ac068c8b8c540eb93e5751872efc51
change-id: 20250319-i3c-fix-clang-fallthrough-9f5c7cf5e799

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
