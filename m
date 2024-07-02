Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68619C3064D
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jul 2024 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9dtdgKfOXx1gW6/6wKto09uF2p8xYVsNbA2UQv/O+A=; b=b3B13WkRbCScQk
	5H/0/Anma16iOU/N/4GjQV1FWnyX55gOiDCKMQfVp5RhbYN1F+Nx5wIbhPK8iJT3rgvmsazgAQIuz
	YtaS2zokCTC8MZ+5O/qSToZnnl9do0Riglio69gsntYD7Yt3HBNnqYVRBt9Mx1RtBVXfvOpc/m2A/
	mIHOUREK2NKySCWCwUHsMssrH0JgqPrWArCXOL+2FIydZN51dFlxRAdarbxcihUoKhfdavmNNtVpu
	FD0Wib0eu8SBqJhDhsgt4Ib83bfgLUpCrNNEMHLqvS5Wnwdts6HY/1m8bs3hYcXwikDnJdBjuwd9C
	BycJ5TQeMQyGuSxkgenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfiI-00000007Fv4-47q6;
	Tue, 02 Jul 2024 15:46:39 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfiG-00000007FsZ-3zWR
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jul 2024 15:46:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A486A24000B;
	Tue,  2 Jul 2024 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719935194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eCLEHHMs8TKwsyPqFlqkEt37rO6vSiGhbAPQUHabSEk=;
	b=QHBExrmG1KTp3MyHBGlyK1iBLu942FLnOOBmbQ5d3v3W0XSdp4UMcYWTiMRpsRLubfaN9/
	7B90FPbiHmI8+Cs06SqekIz0U2XWB1rC2xd7BGz8ZYLf9vl/zP4Rme+1dTUByOpJ7TPK/W
	5w6oVrw4NuKBJsLA8J0eQjizrJAMDFLfQQCzt73mwPdEco5949TALhziPt1fRnF+zS8cuR
	RFuOWWYcw9X+nsktf6WPKWMlFzDTtTTEU8SoPVqeRKZQBGjtHNzMuMDFYW9eJHy90NtZwl
	c9BBM7JQZHG6Y+13fOV8QZyso05hg5Us1Vw1MEBBX4yAY5A370+4ZCao6JN7xg==
Date: Tue, 2 Jul 2024 17:46:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] i3c: dw: Add apb clk
Message-ID: <171993518387.372117.4302073519974460495.b4-ty@bootlin.com>
References: <20240624052851.1030799-1-aniketmaurya@google.com>
 <20240628153829.303719-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240628153829.303719-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_084637_144952_D1ABF7E5 
X-CRM114-Status: UNSURE (   9.28  )
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

On Fri, 28 Jun 2024 15:38:26 +0000, Aniket wrote:
> These patches add APB clk aka pclk to the dw i3c driver
> and the binding doc. Also move to _enabled clk_get APIs.
> 
> Changes from v2 to v3
>   - moved to _enabled API first and then added apb clk.
> 
> Changes from v1 to v2
>  - extra example removed from yaml file, minor renaming.
>  - 3rd patch added to migrate to *_enabled clk_get APIs.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: i3c: dw: Add apb clock binding
      https://git.kernel.org/abelloni/c/a75d62ef7c30
[2/3] i3c: dw: Use new *_enabled clk API
      https://git.kernel.org/abelloni/c/48a74bb38b24
[3/3] i3c: dw: Add optional apb clock
      https://git.kernel.org/abelloni/c/145ca7b61e95

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
