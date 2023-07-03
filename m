Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5260EEB64DC
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyAk1GWh5D3Z4P8eAUlo8m/geLxUzteQINNmXnqKTRA=; b=kmaWu7Jy/Zdybv
	TMZqiYgVejrUqIFeHB1Us6gomtGackrhBOyLXnKbQSCC8ZHoInBvWHSP9cGJOXXJ+i4cqx2KuOKzv
	fRlTEJWJcnTHRqXaQYMgdJwROaaey0Jc0CXE678uYHVWiHZZPRWrKYyJdWIMbGBtZ7YSJNEM1fSsL
	DPulYKlH5YmDCc2GA7JiCo9h9A8udS63JJZR5aa2FAPBtWlq5OHu1oMyLhAL/uzBdVPZk9SVQMLFI
	oF26ehqJplNdoT8cdBI3VH58roIo/j55LfIJXoFrQ/pIc+dStVH+fx3hRt2P1pJtkYy4TbsS6Qr7y
	Dzs42ifZ6Dsk7iljeROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEhT-009iSE-2k;
	Mon, 03 Jul 2023 08:14:23 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEhO-009iPe-2N
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 08:14:22 +0000
Received: from [192.168.12.102] (unknown [159.196.94.230])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9D9352012A;
	Mon,  3 Jul 2023 16:14:16 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1688372056;
	bh=3vG4Y1Ce9Qo+ZUx7zgRT9LamZxjnSqZyYA8M+Re6/EU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MG8hDVpq0S4fuCRWQnn2t81qZilkAi0AnQWQCcT0RXKXCWxdCUlV3TdiT57gtsqD+
	 OJ5diuvizhUlGXAiYVDtsuN1ewrHWAtiqdKEsltc6zumfQoeSE1i5VoIZYHTER+J7v
	 QEQ2Z+lzVsJJ3Iy+gG5nphl3s5LWzonUNVNVuzdiM1f2qzzMFghUr144QPtq8OyWh/
	 gGkG7JLzSqeds1sLW82eaIcVVZ5GemLwevZ1BkY9hwcDSRd0Vs+6W1u1R9aCFdrNw7
	 XcLWnOqeo0KQeD7+M+yWIGe8n3bfgK6kpuYTIRact2/PrumPosDngv7KmLkHQqyvc1
	 mJhg9lJ/KMgGQ==
Message-ID: <d29fc42c04f2e1142b0a196ef7df2d74335cec2e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: Add mctp-controller property
From: Matt Johnston <matt@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>,  Jeremy Kerr <jk@codeconstruct.com.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Mon, 03 Jul 2023 16:14:16 +0800
In-Reply-To: <CAGE=qrrqE3Vj1Bs+cC51gKPDmsqMTyHEAJhsrGCyS_jYKf42Gw@mail.gmail.com>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
	 <20230703053048.275709-2-matt@codeconstruct.com.au>
	 <CAGE=qrrqE3Vj1Bs+cC51gKPDmsqMTyHEAJhsrGCyS_jYKf42Gw@mail.gmail.com>
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_011418_970144_D52BD71D 
X-CRM114-Status: GOOD (  17.10  )
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

On Mon, 2023-07-03 at 09:15 +0200, Krzysztof Kozlowski wrote:
> On Mon, 3 Jul 2023 at 07:31, Matt Johnston <matt@codeconstruct.com.au> wrote:
> > 
> > This property is used to describe a I3C bus with attached MCTP I3C
> > target devices.
> > 
> > Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> > ---
> >  Documentation/devicetree/bindings/i3c/i3c.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > index fdb4212149e7..08731e2484f2 100644
> > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > @@ -55,6 +55,10 @@ properties:
> > 
> >        May not be supported by all controllers.
> > 
> > +  mctp-controller:
> > +    description: |
> > +      Indicates that this bus hosts MCTP-over-I3C target devices.
> 
> I have doubts you actually tested it - there is no type/ref. Also,
> your description is a bit different than existing from dtschema. Why?
> Aren't these the same things?

(sorry my reply minutes ago was somehow an old draft, please ignore)

Ah, I'll add 
$ref: /schemas/types.yaml#/definitions/flag

Testing with 
  make dtbs_check DT_SCHEMA_FILES=trivial-devices.yaml
I don't see any warnings, and neither after adding mctp-controller to a .dts
(out of tree) and testing with
  make CHECK_DTBS=y DT_SCHEMA_FILES=i3c.yaml aspeed-test.dtb

Should that pick it up?

For the description, do you mean it differs to the other properties in
i3c.yaml, or something else?

Thanks,
Matt

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
