Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79691C7619A
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Apr 2023 04:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jV+RaTkswDdBrFA/dOLC22lOu8G1GR9ttYMu2SO2u18=; b=Aol2uqPhX4oNJd
	y9nDEagQc0sB8/Polkh4gIYUmiQKDql9d99FIdryIRdXKhlNLzAPQAX+Hy8XmSi+L8XOsoq3b/BLQ
	R1mqNkBJAPxqIn9WNDtQZfRLKaqkbRKk/k9knKVq8QYT4fTl1roJJ0GSE+gbDHxBiVDz8q/9A9uBF
	11QACmuOvGtOPZigLbK7TZ0s1ePu142TsgxjfE6nQl/8sPc9QEBilxjIwstg0mmMSyduCS4EvY2t8
	25eHJrZwx6IGFqoyX/liRyM7SGcWH0nZR9DYdwyr4bfUcfIZDI9LzCLJ6sttogcqVnt1UIK+HNtXv
	ywJoakH/pjedWxD05FdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjurP-003Kez-2V;
	Wed, 05 Apr 2023 04:35:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjurL-003Kdc-1G
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 04:35:00 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4E08120034;
	Wed,  5 Apr 2023 12:34:46 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680669290;
	bh=/JY2GxUV8U7PZngfK9sN6bkoR5ACX/UvT6PfeNBweuM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IXb2wDEdqFp90wdXnhW8iMMEHY8wgKoHLl7EYL59NXC0Wd/Z+LQP9si5bE78O4Hpu
	 jgoyRd1c8MVesV4H8maoFsrFl48WhplmDRpRbTEiF0vQtsdi7SaN+TkN+WYSvm54IX
	 Pi766232ohCgD1zl4lsOIit1FdEjvgI3k3mtTqHTiAhAeSfTRY7X3TsyMgmKCLWhPQ
	 C/spOsDuM3q1MlJ83SW3pYgbQb2BNvEoL5cdZ7WQH83DKxm1MkudoUpKBLbEcuCNzD
	 kpp6y9D2Ld8V42fbjI9bTaZVzI9/Z2r9/txrOrz4GkTnYJJog/Ua6Q2pJRjUStX7rp
	 axgm7LdCgP/Dw==
Message-ID: <94e941a2895bbb40d7b87acd7de6525b8596b096.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c
 controller
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, Matt Johnston <matt@codeconstruct.com.au>, 
 Vitor Soares <ivitro@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jack Chen <zenghuchen@google.com>, Billy
 Tsai <billy_tsai@aspeedtech.com>, Dylan Hung <dylan_hung@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>
Date: Wed, 05 Apr 2023 12:34:45 +0800
In-Reply-To: <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
	 <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_213459_654889_05EC24BB 
X-CRM114-Status: UNSURE (   7.95  )
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

Hi Joel,

> Given we have acks on the bindings, I think it's safe to send the
> device tree changes now so we can merge what you have in the upcoming
> merge window. If there's changes we can modify or revert.

OK, I'll get those into shape.

There is one dependency on this though, and unfortunately it requires
solving *two* of the known-hard problems in computer science:

Do we start at i3c0 or i3c1?

[i3c1 would match the schematic...]

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
