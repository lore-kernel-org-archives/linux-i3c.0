Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29AFE63F3A
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Feb 2026 08:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSVl6BoknK1mi5xj9AbYTWZtRaKcceDM/AcoW9f8koU=; b=4Ddr0zvFrSq0X0
	qqtfoo/nP1X88KW6PCE1YU9lw3AIhL4ZmQ0e/dwzY+8/eSNrCjvx2jUcwkYOOzYhN5fJyaUpuRChZ
	Q6lUJ0VZLkgf2X1uhEWOyquY8q9WCMBTfhLLuaPkxVXtjOKcqh2KwBFqsGjVLtrGDx8SVXe/hjiBc
	naHlnbaSzh5gt99DEQ9PC7j8nB9pL9zcQjCn5RUMJnIlGK9OPfX9ewyPPiVwxdzdfoXklJIEwJFic
	83UfA5UjiApD4STlJ1BBZtfT35HqyFSa4PcQjz4TPx+lV8JQiw8rCvQLOWri2XNBD+Jb/ZcNkMmQW
	6XPnlxCO4SD202kXczgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vru2b-000000069hi-1anZ;
	Mon, 16 Feb 2026 08:33:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vru2X-000000069gm-1ogk
	for linux-i3c@lists.infradead.org;
	Mon, 16 Feb 2026 08:33:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0FF4BC17B7B;
	Mon, 16 Feb 2026 08:33:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BD37606CF;
	Mon, 16 Feb 2026 08:33:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 508F61036908F;
	Mon, 16 Feb 2026 09:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771230784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ltBVPeOt5z5WjOiMiEGSl1Ql4XC8MVcQkC545gvTXVk=;
	b=g560gdWGk4NtlGEUXeJFKWHrZ1g2J52Y+CRGS/+n2lX1ipT3FoS49uOllNUJBvtfLxCvxN
	RTI4QWX03NAby1de74jQoE8TiLNlTlPOcjfzj41JyprO9UAtiyJZ2cyO6aT+9KyY7UKMNZ
	5eLR9jv3K91FZTGUZiV/RjERoDMGS3AJX3oLOySkJ5YDPApC1+PVuPS1R4pGZRD9nkzrRF
	TaaGc9WCyLqaj+hkLKJ8kcONKeaji02yJrHJunN3xt4yxm2VPMEvomx6cobqgfns9OpBAk
	Iwh0Z8sqoBkjP2Qc7X/Z4WA9CTj2Z6AJS3dbZSDH3hWhSgRUzc5qb2Rs3mynBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,  Frank Li <Frank.Li@nxp.com>,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  linux-i3c@lists.infradead.org,
  imx@lists.linux.dev
Subject: Re: [PATCH] i3c: master: svc: spelling corrections
In-Reply-To: <20260216061755.2801697-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Sun, 15 Feb 2026 22:17:55 -0800")
References: <20260216061755.2801697-1-rdunlap@infradead.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 16 Feb 2026 09:33:02 +0100
Message-ID: <87zf59ulz5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_003309_984121_ACD138F1 
X-CRM114-Status: UNSURE (   3.60  )
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

On 15/02/2026 at 22:17:55 -08, Randy Dunlap <rdunlap@infradead.org> wrote:

> Correct spelling for 3 words as identified by codespell:
>
> svc-i3c-master.c:340: tigger ==> trigger
> svc-i3c-master.c:532: reamins ==> remains
> svc-i3c-master.c:734: filetered ==> filtered
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
