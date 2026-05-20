Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90EDCD4F54
	for <linux-i3c@archiver.kernel.org>; Wed, 20 May 2026 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZ9vJm8HXriGEHtcOwFIPkSnkdT+D6OMB+zcG7oHCnE=; b=STnVdYSzzSCvK7
	/ZPYtRt4qDErVfJK7fvQVaCenT2z5tEXp8Dpt3zGFOqXaHrSlPtgYqAs+puu6jGYWSgcs1bDab4vp
	D/V9Na2cNpOyvq4047DjVdfno2xrCuG5rxPpqsqgFL2Wxq4gg3qsv9S5KIo98AEpjFBLmrCqtfTyF
	WfLVZbXKq81YyJftBjGsElAOMy0UEmJyq+X3eZhFyXoNOgHXO2F9xq/fXMOjJubOuunCdZ5mfucy4
	Pa7M2P2o3wUBQVNEtlZeo22co43J5D+j/lI1bS11vhHRn55Uj1/Jf/Q5SLwn2rOf00Wn+S1/E0Vtd
	Z/W7KBqkV8KAQSIiBpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb8k-00000003lWs-1cDk;
	Wed, 20 May 2026 07:14:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb8h-00000003lUp-3Dvk
	for linux-i3c@lists.infradead.org;
	Wed, 20 May 2026 07:14:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 9CCE144346;
	Wed, 20 May 2026 07:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E991B1F000E9;
	Wed, 20 May 2026 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261286;
	bh=CR30oqSQ6PAPndyEpsanM1fqwluFLdlEhZ6QPhyA/Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EkAg3pLkGc8lvnf3hSYeLhpOFPZ+IPZwFImM84q9Rbd02ZZso/PWEEXSGxwzy1uDL
	 4ojBTNQbx0FP7uyRSHEc8fPuJgq72qGLuaDSaisb2mYM6hdlj9hHPzm2vcVvjamwz/
	 LL/TOvZaHtQL3XkYsQEGBNbP4UKhrRPRZnu+VtK371WoGVmUOzxp5nGW33hWPYDgU+
	 BXtN2WrVDTrgXlMjz3xn9PxFxt9NtqfAE8+6lVFg+eqGg1/Xh2YlTDpTAoGZzf7RGU
	 jyXu/JUV+0vgj5hl6fx+Y612SxJ0xbL6E6zb790Wi9XoYmUvozJLSUiZtP03aUaay4
	 qxDChN3oijxBw==
Date: Wed, 20 May 2026 09:14:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: i3c: dw: Describe core reset
Message-ID: <20260520-cocky-thick-wren-900aa0@quoll>
References: <20260519055105.13079-1-jszhang@kernel.org>
 <20260519055105.13079-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519055105.13079-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_001447_831555_A0B0683C 
X-CRM114-Status: UNSURE (   6.33  )
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

On Tue, May 19, 2026 at 01:51:03PM +0800, Jisheng Zhang wrote:
> The core reset support has been in the code from day1, but the

Well, no. There was no "core" reset from day1, so your entire
explanation makes no sense now. Previous version was correct.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
