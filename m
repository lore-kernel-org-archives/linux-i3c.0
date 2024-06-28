Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C369EC3064D
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syURHHBRpzCg/mHE7rBP9pv+rpH7xoChLfuYr6U7njw=; b=cmPcsC//0yJ3E0
	z+tRkpAnuhsjk6ofsA7030k/fOFbkokdJL0L6ZCAoAtrf4z2qOYCrUFP5J4kcx/bIHJsFiwqLC1K3
	C1yYkOXlqNCgV8L1kRXiGk+3UNaPCN76/Y/qZS+EyEE503bGF70AmnbheAdMBdr/poULqdV0Uw68A
	Lpjiw5ZbFxoF/qdalmSkOM/xUttaoxdkG+dnx2UUlOMPrQHvnLU+jVwUsClE3lP48tuz9Zo0gK5N3
	Aty+I0Vi59oPkSbjt92/pLWO3TmdQZ0+R8yZHaNdqcf/dPiCHtO/MbOm7o5kynlTcN204LT2Bqe3g
	auPUJJ6QNpv25W0ZFtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCkY-0000000E2zw-13X7;
	Fri, 28 Jun 2024 14:38:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCkU-0000000E2xX-36yD
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 14:38:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1137120003;
	Fri, 28 Jun 2024 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719585527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E8uMvsd4WS+2K8bjcQh7iIB/i1TtRbmb1QqX781ydsA=;
	b=N46pqqDP9XPqSqocLAjTDryh1mRIf4Sk0f6YZ6Bxlrw0IGUKE6UekXF0JkyxKr5kg8Rcm3
	HdaAwtoaTrjLR1arPRMUgMEQ5MAEsC6HcTB0QZquuzX2Yl5oNGzvXw3/QuHsIdkYHhtr7N
	qDdtL9dvfahG3IAeyNvsbM9mp3jI1V7PrIuZuG8ae/9cftoZ7panu5syYiGSfVtc3YeCgn
	KiEOl7nZWdYHHHQxlCfwjm7+pzMaICIFeLdQPcs29hie3zDQJ9rttygkRfHd22fQ9MNvtP
	0Q1dr2anrh8lXKmApzLcyYfTaDEROQf2p74ldYYYcsMZ5dFNPKzTGoVRx/7skg==
Date: Fri, 28 Jun 2024 16:38:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] i3c: dw: Remove ibi_capable property
Message-ID: <171958551738.36342.10923962764152593663.b4-ty@bootlin.com>
References: <20240627034119.3938050-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627034119.3938050-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_073851_066663_8437AD86 
X-CRM114-Status: UNSURE (   7.15  )
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

On Thu, 27 Jun 2024 03:41:19 +0000, Aniket wrote:
> Since DW I3C IP master role always supports IBI, we don't need
> to keep two variants of master ops and select one using this
> property. Hence remove the code.
> 
> 

Applied, thanks!

[1/1] i3c: dw: Remove ibi_capable property
      https://git.kernel.org/abelloni/c/11e2594fd316

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
