Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20A0C5DF7D
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 21:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hl7FQYTlddFsNG22ANQ8DUU3JU30Eld9Mx5ZfEusw8=; b=IjMGUTNs62TH/u
	wG69yr8IDoHAf5Lk2lY0OL5wVr31eHCsELvU6i4UJIAdXF1LydU82A3pswo+N7dpuzzs8J0xk5ma/
	FzPUZwy/pQDxG401fcl2ErbCo7y84TuDo+EOTNBFheIiHZh2DLS9kU7tVG99d14BuXBuxZ2/ibUpN
	+7lNogdVvRia9O1tG4c0SxMpAittvl3AjqpoiQsOadAeZDq9BzPplVLwCYPT280MaKLutN3JnoDWH
	EMHfVNP6zTsQsIvDNctUcznnyYzSJe0bmQriUGHcOkkBVRu/k26aIUetm4fqi3jDUuo0Y+Tf7zFHN
	CnEs88Yf4rrZL8/eL6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRAc-00000008fFi-3cJG;
	Tue, 18 Aug 2026 21:16:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRAZ-00000008fF3-0rDm
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 21:16:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 382AF4E41289;
	Tue, 18 Aug 2026 21:16:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4CCD60355;
	Tue, 18 Aug 2026 21:16:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7A1811C74F82;
	Tue, 18 Aug 2026 23:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787087779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+hS0WmlzQcS9cWCOt291VZX7abSXqlQlEgKDzGdzxl8=;
	b=lGSUEG2Kc83sfXExcg+dEIPkErTk3eQDfWnAUlQZK1YNM/cpAwyiJtPxIyHhhbzvly633/
	igOvXzzZOPJEaWQntpaTng0va0+mxUO+Gh0o4ujExYmKAZxr9AKoWTzplAuGYZtBZgdGE9
	oUi1jyAsuCAjA577z2aaqMq3k9cy/tFfzROLixasvA81ViS//PQRbs66uhV22zoMOuQCh1
	VSz0JLUkKsKFn63SGeqQMrvgBQ2V3FO8QVfi2FgYkRCwDSwO373Q13quZwgOsNsvwZfHjr
	wd4kK1X+EPjhLMYLHPX/iEGnZX9ZhuhHmXZ/okUXXnYAeGnqAWIpvwD46tbOSA==
Date: Tue, 18 Aug 2026 23:16:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw: rename "pclk" to "apb" to match dt-binding
Message-ID: <178708776859.4069350.5728740208636793879.b4-ty@b4>
References: <20260814040345.23033-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814040345.23033-1-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_141627_386230_1DC7107E 
X-CRM114-Status: UNSURE (   5.49  )
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

On Fri, 14 Aug 2026 12:03:45 +0800, Jisheng Zhang wrote:
> Change clock name "pclk" to "apb" to match dt-binding doc. No upstream
> device tree sources currently use the "pclk" clock name, so no any
> backward compatibility issues.

Applied, thanks!

[1/1] i3c: dw: rename "pclk" to "apb" to match dt-binding
      https://git.kernel.org/i3c/c/ff2eee2b8686

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
