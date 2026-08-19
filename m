Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095ACC5DF6D
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2026 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U4zbENrl3RSxtjRYIcp3kcbf2l0b5bfUF7NxkzPTcA=; b=rEW6ey7pRFafmQ
	WCFh7x7Tg5uB2SjrgkaWTdA7XmGeEntkIkGAk7c9nehs2yuw5d9VMQmTxRumky3tK5PHl7h8t1BSG
	EpyeN39FlMTeMs97rm8bhIlK4QuYzPZruTUgJnLhZyS4c3timS+7OCkzF3Sa4DlPrmTqLNCXbZqij
	NcDiml6BtpRRtrt9aOZOisEZWt3vT8I68v8CfmNe0SHGN1y1t7RcGtXT1HjyxZ4N3bFmEThGs7OyQ
	wv41zMoM1fc+5MhbT99nhz6RP+cdEqwWnVoLA0P+v6CgRpy7LEdpVm8IymsY8rKoL5H3kJxw1+c6R
	KM++tUmpOPH3ABnDhS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweqA-00000009i3n-2c22;
	Wed, 19 Aug 2026 11:52:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweq6-00000009i3R-16m9
	for linux-i3c@lists.infradead.org;
	Wed, 19 Aug 2026 11:52:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 665161A1728;
	Wed, 19 Aug 2026 11:52:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 336755FF42;
	Wed, 19 Aug 2026 11:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C68D11C70116;
	Wed, 19 Aug 2026 13:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787140325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=MO78xzJv0MvWZ2XJ7sgUln3Gly0+OKEWmDLIWaHKDbs=;
	b=yZ6Z2b3H9SMbYrR6YnMhh2DAsUn6i8zBeoF3NXUGTZFftkIIK609MxDlxzckRKxRKhY7E9
	9/gVtaBT59jn+J4JIjs5x/P3Hh9u7Ls/0bTBDftMf0W2cape5B9ZitB5Q+r1qkm4piRRDF
	amJPOOGsRIY5/LQ2UyIa27CZX6NYo+67Xg1GV0lTBflzb7ak26m1Jq+jiZBegT3Jmc9ls7
	pkQ0DOkl3nq21XvfNXJadslKuVmOgnUJqPDGQ0fIrbAhbtnNhGLL9T+c4oaxfH7PScl7st
	N6Kd4de4bsEkSbz1f8Id+y55E7bf/BCbnzB152fOF07XoIcxr/zB2miZXgabEg==
Date: Wed, 19 Aug 2026 13:52:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i3c: dw: reduce do_daa time if there's no client
Message-ID: <178714031607.44549.4643447948448571257.b4-ty@b4>
References: <20260819044833.32611-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260819044833.32611-1-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_045214_476335_D765581D 
X-CRM114-Status: UNSURE (   9.73  )
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

On Wed, 19 Aug 2026 12:48:33 +0800, Jisheng Zhang wrote:
> dw_i3c_master_daa() derives the number of newly assigned dynamic
> addresses from cmd->rx_len, the ISR sets it to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already
> means "every address was assigned", so a timed out transfer leaves
> that value in place and it gets used as a result.
> 
> If there's no client connected, the addr assign cmd times out, then
> the driver calls i3c_master_add_i3c_dev_locked() to add devices that
> are not there, each costing about 1s, thus adds non necessary boot
> time up to (maxdev * 1)s.
> 
> [...]

Applied, thanks!

[1/1] i3c: dw: reduce do_daa time if there's no client
      https://git.kernel.org/i3c/c/cab40cfc9e11

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
