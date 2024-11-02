Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF0FE67815
	for <linux-i3c@archiver.kernel.org>; Sat,  2 Nov 2024 21:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84U1S5K+Af2uTuAqPQDr/fzNlGObtAigCqORcbTEBuk=; b=PRElZt+J14XwRk
	lT4a73YfmHSguvb2vuPtF5WzaYXP92v7qLzHh5rfdePid87ISk6y1jHtmttotV/zE7cWbJPeaba7g
	9JzaAxSTORdviiWZD1oqxHCNAS84NHpVRj6QUw31qqBtM+E2J/fnnAzXyyop5PqHVAGGyJ6nv2egp
	6V0YjK/gwEcJZu82zjeJwSX6Ue3Rc44eTL12TSqYlkP1e+me4sT1iNROSCaKQtO06BkQJUssj0BOp
	KDow270xEp2yeuPE1gQmSIgUKC49ZMB+I/FsK7gpxA1fJ1eT0YaT8+/2aRH1Tt9Qf6TMgY6rKIUmM
	kp7sJ1L7sRTIWnGcoL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7M7s-0000000AThA-3SA4;
	Sat, 02 Nov 2024 21:57:44 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7M7p-0000000ATgT-2xD5
	for linux-i3c@lists.infradead.org;
	Sat, 02 Nov 2024 21:57:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 654DB240002;
	Sat,  2 Nov 2024 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730584657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hXexRIqonxXbwwjZfWS8TncvThZ06Lgb4mpHYQaEmuo=;
	b=dUbpU3Oq0gFXPE0fErNip2xqgc8AZUmJauISfT7RXm8IX4u5e8TuTm1QDi968KnLPtt4PB
	TEK/o1bYCaE/3O/Mb+rS+6GJdGBfIEByt5XlNrhX65H/l7PTYg3w06G5pblBoUzV88NO3F
	3Fgru1H56+XKHI7Fy7MLtXrCkFPcQp/QuOqa8IEsWOnXUcNYcs2EgXiB4vVlUkzaA7FOMK
	z4NQdD6Bg7E+zaEWsakUUYEvsvD9rCedySmm2BCXbxYfePeLj0XMyu7jc4R0/xpaHp7dlu
	8etAPkFRAfsuBpnlFoul3m+rLdRVLNTxAcqyuyH7JJYGSf5ypR9D5zjfgeVKCA==
Date: Sat, 2 Nov 2024 22:57:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	miquel.raynal@bootlin.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH v2 1/1] i3c: master: svc: Modify enabled_events bit 7:0
 to act as IBI enable counter
Message-ID: <173058462779.2458498.8277709682001410265.b4-ty@bootlin.com>
References: <20241101165002.2479794-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241101165002.2479794-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_145741_972322_4B5E6141 
X-CRM114-Status: UNSURE (   6.43  )
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

On Fri, 01 Nov 2024 12:50:02 -0400, Frank Li wrote:
> Fix issue where disabling IBI on one device disables the entire IBI
> interrupt. Modify bit 7:0 of enabled_events to serve as an IBI enable
> counter, ensuring that the system IBI interrupt is disabled only when all
> I3C devices have IBI disabled.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Modify enabled_events bit 7:0 to act as IBI enable counter
      https://git.kernel.org/abelloni/c/25bc99be5fe5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
