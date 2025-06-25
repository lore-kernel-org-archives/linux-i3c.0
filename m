Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ACDC77B7C
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Par9Gp/+/FzV9OwgzOOw1doos34FVIpBeqOM6utG2h0=; b=h31Pg0ylER/xVm
	bll1LCLUVHX1OKxMNpYtbrqP7m0eG+UTnb/r/aa1yQ6YMoSv1C1a5CJrr1kzTaWmn3abqgmjH+FvX
	9MKXE1eZVqwSJbW8HdKNlMGhvJOxxsjrQu2E/eMexQDJ6s6s1QD52eitJR+7FSRgrwjASKyhYwmJF
	yLRv+Ito26hgH5a5ntWztxKF3TXdBzCZjmS8rDHSeeUeUCxraYLDl9VvIkPE0Ia5ZhWroJSqUe7Dk
	kDpsb6NZ4wnDlvBjpihnar/HYTNXXf5KRTPVEmdMzPvaghqA5snHJFXILnUCP1GW2+TNQb9U9ldcX
	AgtqFbzv8iSLNoDhINXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpY-00000009yiG-3cIB;
	Wed, 25 Jun 2025 21:38:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWMW-00000009nzQ-3xKN
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 20:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDB845C5B9F;
	Wed, 25 Jun 2025 20:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D92C4CEEA;
	Wed, 25 Jun 2025 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881892;
	bh=Wge9Fm4x36OgbfZOTFgwfrZuYoukt8bZYelLZzh4bd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjAaOqGZZk9YzmGzRpHefzfJlf6naR6zPr4PH5BcqwtGrlsEaInaMI18oGzB69azi
	 ukB+4+1wCNHwqmjI0zpXz9X08fBkyUHeh50D6CNYX01s8fhMEWnyqz7K54EtNnfsKx
	 OFFajCgQ7UW5zE9FR8tnNgxJlMghlqlqKftJfHlsExvUQJcdxziWN4whV56tzfwABz
	 F3uOmvQnljBbSivOb0Z1im/Xnq3ISH6acCmhKlOS5DQwNhN+LOuOMHTtryOuj+E6bQ
	 QcOOqhyAe9llU9z5XwEg3HKAT5eJbFbNUYW+ee6BUcucCwvJVNjJGko38UmGVIFH0e
	 IfNc7eurzjyxg==
Date: Wed, 25 Jun 2025 15:04:51 -0500
From: Rob Herring <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <20250625200451.GA2117971-robh@kernel.org>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
 <aErkyDQvV3C0TZSu@shikoro>
 <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_130453_028272_CD61A0F9 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, Jun 12, 2025 at 04:51:42PM +0200, Tommaso Merciai wrote:
> Hi Frank, Wolfram,
> 
> Thanks both for your work.
> 
> On 12/06/25 16:31, Wolfram Sang wrote:
> > Hi Frank,
> > 
> > > > +  clock-names:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: pclk
> > > > +          - const: tclk
> > > > +      - items:
> > > > +          - const: pclk
> > > > +          - const: pclkrw
> > > > +          - const: tclk
> > > 
> > > Suggested clock name is, apb, trans, srfs.

Suggested by who?

> > > Needn't clk surfix and provide meanful name.
> > 
> > ? Why can't we have the name from the datasheets? It will be
> > unnecessarily hard for users to verify the correctness of the clock
> > assignments if they need an artifical mapping of these names. If they
> > are the same as in the datasheet, the same task becomes very easy.
> > 
> 
> Agreed.
> Since the name comes from the hw manual I think is better to leave it as is.

Agreed.

While 'clk' is considered redundant, naming clocks 'p' and 't' is too 
terse even for me. So the rule is clk is redundant unless it is with a 
single letter. The rules apply to s/w folks making up names, not h/w 
manuals.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
