Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBD1C433F5
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Jan 2022 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AB1JKQOUo/Wjdwt5QvQVPOLyVNRv+35rZKVCc1jA2ys=; b=Rw3l6kxaJ34r0q
	f5W7c7l8ARp7yf+tUSpOdeKeu4lTJSc51UHJ+zeJIqprihkLNx9atKDVvwOZCwHmb63MIQgZs79GM
	k2azaAQtAxVtVw7B0qRnzII8Rq4Wk4rtcLoaqpw4CTKQKI5AiROuuiaQsQVAHbCqSbpSP4XoW+0xL
	ZFNMVFq2xupWh0gBf/mFJRyAhAuvkwZ3/qKSzDPfDUOAVSUxv6TK5pjz36/aHbD1NkV8zcnql7KJt
	zHJPYRBHpEkFghMAzNI+0F64d7ZDEjcwYptc0Cm/AE2IIWoMWNvxQjnIQQeqwDl5TlG2fOEt4VtQ/
	o+8yb8/JpSv3acFGgCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7oaI-004C3W-5v; Thu, 13 Jan 2022 01:07:22 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7oaF-004C2t-BI
 for linux-i3c@lists.infradead.org; Thu, 13 Jan 2022 01:07:21 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 486C1200002;
 Thu, 13 Jan 2022 01:07:12 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: bbrezillon@kernel.org, trix@redhat.com, ndesaulniers@google.com,
 vitor.soares@synopsys.com, nathan@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] i3c: master: dw: check return of
 dw_i3c_master_get_free_pos()
Date: Thu, 13 Jan 2022 02:07:11 +0100
Message-Id: <164203602351.2985932.12500501407570919307.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108150948.3988790-1-trix@redhat.com>
References: <20220108150948.3988790-1-trix@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_170719_567486_3A43D925 
X-CRM114-Status: UNSURE (   5.59  )
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

On Sat, 8 Jan 2022 07:09:48 -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> dw-i3c-master.c:799:9: warning: The result of the left shift is
>   undefined because the left operand is negative
>                       COMMAND_PORT_DEV_INDEX(pos) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] i3c: master: dw: check return of dw_i3c_master_get_free_pos()
      commit: 13462ba1815db5a96891293a9cfaa2451f7bd623

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
