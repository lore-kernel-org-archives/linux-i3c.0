Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB1CAC587
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw8tZrfbWJszVd9KWOuLfCri17uDbfA9lkX3PByQcEE=; b=T/KDFqXi1ibnPz
	gudxTEtM/ADcxOf2USjo3uz+U5JhLhkvMayH4o3d3Se2e47hQVI6C3XmfzXNYAFnQWuKe29Im09U+
	obabzQto7kvAeG0Mk5PNoMQmRCI3oapcl1P4OAZBXUU1Orcj2Awhz7zwUDhMSFqmZTfKSx0u5P2hl
	VXmMdWo8OfV5LdFZsPskwIOFTyX8KnyRWG2sJVPmmhLkgXjcauteqHLr4UyiKV86R63biwKl6nxey
	I8YYYhTjcwIUiEImzd6YaDSDBQDYjZbuJis3Yv+l5cPfbkVxKhHwLC5aGc5nEeWhuwP6HCkihUCd2
	sD/F3NTWawj1l8/nT7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtjf-00000002CNQ-30ZY;
	Sun, 14 Sep 2025 20:54:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtjc-00000002CLN-21Za
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:54:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C64A01A0DE4;
	Sun, 14 Sep 2025 20:54:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CC546063F;
	Sun, 14 Sep 2025 20:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51B56102F2A80;
	Sun, 14 Sep 2025 22:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757883246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=365rKbEk4F7OGQkHpZDwYWQUHqCJNim/0g4ZKb2td2Y=;
	b=1fRRNe2Q43C8PtasUssv8DhRBvddFMPIaE5ckixtWrfYE+bIHl3dF0wb7B6mMy3Fc34xyG
	ePT40SQehgVvBrusgQ67/PX6BmXrSxENnrQtJzvDCj2CvIIYVTN9mh/Q1t9TtHt21Bi4tp
	o5o3MpVBDI/avS3LNqKMs2jq1p4B7KykhJcnNgMXCqu0eAcFjupVgo57ia99BVmqMEc/Ds
	b5zwkhy04gZ/NI7owHB8q9wyX8Op1LNUVyCAZq27Wgr+9QVd9pUbjJKKxcoq33AAfUBYAM
	xDKQthXlqzLQPG0okHUtlX1lPGW1DgQCT88j9LoklzNsvfZWq/K6sQmNBUYTgQ==
Date: Sun, 14 Sep 2025 22:54:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v2 0/2] i3c: master: svc: improve IBI handling
Message-ID: <175788312843.382502.3655155684242628027.b4-ty@bootlin.com>
References: <20250829012309.3562585-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250829012309.3562585-1-yschu@nuvoton.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_135408_651657_7F599B15 
X-CRM114-Status: UNSURE (   6.63  )
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

On Fri, 29 Aug 2025 09:23:07 +0800, Stanley Chu wrote:
> Improve IBI handling to prevent certain error conditions.
> 
> Stanley Chu (2):
>   i3c: master: svc: Use manual response for IBI events
>   i3c: master: svc: Recycle unused IBI slot
> 
> drivers/i3c/master/svc-i3c-master.c | 31 ++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> [...]

Applied, thanks!

[1/2] i3c: master: svc: Use manual response for IBI events
      https://git.kernel.org/i3c/c/a0b61a0b7a59
[2/2] i3c: master: svc: Recycle unused IBI slot
      https://git.kernel.org/i3c/c/c514db2b47a0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
