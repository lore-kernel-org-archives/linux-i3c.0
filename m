Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B5CD4F39
	for <linux-i3c@archiver.kernel.org>; Thu, 14 May 2026 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCzYyxTZugntJg5sr2jeasfEgr3wlgau8CuUDeNthx0=; b=vYaOnmQiOezfYb
	+hIACU9Fv8yFVBPeSVb0xaVd4RZVRw+rJ3tRFe9AlN85Vlb47iqrlHxXqddJgENYozk23d0VnUQpA
	4wxuMHlOd2ZSFCsmVArJWDXgKAn6vKWOvhCSs53dWZzTHfVty1eVVNBnVQSBPetFfAHeAotqg7I/c
	4m8NaCqWeVQpDe6TMRl5VRCqBG9gGMxGCVQhZ6UmsanEckFsmv/fLRQwBZKBV1VFXFJsg3WbYvx1T
	Q9egmgoBZ+jIvtijh+mrStoOt566/do7DVhnGT54R0iDtPdDjJsFwfYVNoXJcOjIlRM9WCpDkbrCv
	tsQBNxkxOcGgRk1U7cYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNV0r-00000005R7W-0j4p;
	Thu, 14 May 2026 12:18:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNV0p-00000005R6k-0rmp
	for linux-i3c@lists.infradead.org;
	Thu, 14 May 2026 12:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E69D40256;
	Thu, 14 May 2026 12:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50F9C2BCB3;
	Thu, 14 May 2026 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761078;
	bh=87+aO5p1bNGRBRmNNQEI8+KVqy308WQ65fW8y2LIPgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEd74yD8e32sOy+/u6cjwDptdso45Sz2uIDhAc3L1/CNE0QF/70BLrgB5xN6fAIb3
	 mYJG0s1xxiMKC1uY63zsEjm8g+OXbKMop+wKc9xumvN8Vma1KI5DbLcQTTDUB537Z9
	 72Z+90MN2yZ2OzAXcmqRoYeDmEepX+psEpysCD3/ChGYDh3Cguno+1rq5WEfH6wnNB
	 F+ccoM9/ZwCnjf9sfTfLlJhamUxDxrfQ2ZCnlRIT/ZQJVarV+MstOA+RAR9816QQ8R
	 c71jF9alClI/ih8ZzUMXWBI0cnnAhEE5nlkZzp7ysoS0gKpjnTyLp/5OInD+iTyQoU
	 LtmzkQYBL0AZQ==
Date: Thu, 14 May 2026 14:17:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <20260514-fat-unyielding-jaguarundi-a5ddc6@quoll>
References: <20260511031945.3228-1-jszhang@kernel.org>
 <20260511031945.3228-3-jszhang@kernel.org>
 <20260511-amnesty-afoot-84537aafc02c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-amnesty-afoot-84537aafc02c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_051759_267519_15E75E08 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, May 11, 2026 at 05:02:18PM +0100, Conor Dooley wrote:
> On Mon, May 11, 2026 at 11:19:44AM +0800, Jisheng Zhang wrote:
> > Add dt-binding for support of apb reset which is to reset the APB
> > interface.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Please squash both dt-binding patches.

I think this should stay separate, because first commit is trying to fix
undocumented existing ABI. It will have different rationale and could be
chosen for backports.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
