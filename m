Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAD4C30657
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXTXtKVQsLPRvYJo/WbICBUmBa3j2J5TvPxjRq3VNnM=; b=a31k9l1wZ0/iMc
	3HfnuR2jclVJ5irvQSsCEq4XGGG8Iu4U2tqstwifv0225+wKwKb9jYtOIhmKW1eT4m1629U0cS50v
	vUzxHBeC0+dM+omMOOpZNWyA7PVNh+V8wzoHhSQPzum+MXE13SuSYzl+hTEzCveLpPlVT3nbOYHCf
	S9FIbszbfARuX3RYVKwgdf0Ar9gTRfmSomRR0VGFPOogxX2Dkk6WCgFtkbwZd/nh8Gg7VuL2q0V/k
	uLx8zRY7b5KRKcT/VhYpwIREOdYgwc3vzzE0mODe2//Y7gzn+15iuJlt2lIf/r0xyfQDLKVZEETdp
	8roNBFM4TlfE456R5tLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQLK-00BPEY-20;
	Mon, 03 Jul 2023 20:40:18 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDmJ-009Y36-2F
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 07:15:20 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1a1fa977667so3797760fac.1
        for <linux-i3c@lists.infradead.org>; Mon, 03 Jul 2023 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688368518; x=1690960518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IAZeTOZazbGFZSDmndWdfTDNm2nB8DtY7mHI7XdQ7lk=;
        b=fwrYNJNQGr2V0i3pfa9Vg8VYK7yIzXp54Mx+sp9Ejgte1Va2hgY8F+rZDIsw+Y9Q6a
         nRp4ePOT5h7wKwqbVlcJXN9hTKgM7oyd4UeQO07XFij25ieux3InxE0J+r17kKtg+SOw
         +KXyXKR5Ml/hsgMppG7m5Hwz9fpFa2difABUqtcE3OrYMVi1I0n2V/1/1h1l5rS9iFGB
         5oKBkl4Fe8eFguqnOmUgoV8tPNUCW81H57jVYbBJKY+sKxUH7u5iki0WF4DTDw4yxJ6v
         r7nRIsXBx7VZ8Ul6LRsU7Ac6dILJQPncwm9o5+FgSpMkcd1FJA/yplKZ6q8fbIuqrHw4
         FPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688368518; x=1690960518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAZeTOZazbGFZSDmndWdfTDNm2nB8DtY7mHI7XdQ7lk=;
        b=jQ5mj+mOZdq/qsb9tRamKoP5dm54ccKEuvefjtkwCOWsrxJpEpmIUAETv1RBA869ox
         MkK9Up9oDOBck+MDay2Te7oOhYR/fbW0dBMEXWplamy6MpmexKEc56xLJchdR20+lplc
         G89KwiMwucrayf9mEbvo80EldCqNln04QmqaRlq0pMhX/CAZ89zU5TCZG/xCbmzKzoYv
         0EiUkzK34UAh0/Buj+zqlyJGbMms3wwtidTXlBDVo253XlrT9aECnqBaq9DbgfqN1ILp
         bwhwUESQkBF+KRgRKJr+GMCWtnbQCef3dkiGVmbSLdQecyYJGWjYdYj42yGCAfxIH5Pd
         JqOA==
X-Gm-Message-State: ABy/qLZ4iVSkHeCiUvQjxMqQo4hwddISklHapTH3gTn6FR6BghYtpQBZ
	Jn+TelZ1SWOK4MV8cw08WQJObADYchXk0s3EsW4NfA==
X-Google-Smtp-Source: APBJJlFl1y1DD9smdIG3z9ZwGyRcMYA2S0C03PiyGo2Yyt6cyslQgtkKycE8R19wvHB6Fw36fGyu2SOkeqKm2IpNDeM=
X-Received: by 2002:a05:6870:6c1c:b0:188:1195:5ec5 with SMTP id
 na28-20020a0568706c1c00b0018811955ec5mr10062907oab.39.1688368518367; Mon, 03
 Jul 2023 00:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230703053048.275709-1-matt@codeconstruct.com.au> <20230703053048.275709-2-matt@codeconstruct.com.au>
In-Reply-To: <20230703053048.275709-2-matt@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 3 Jul 2023 09:15:06 +0200
Message-ID: <CAGE=qrrqE3Vj1Bs+cC51gKPDmsqMTyHEAJhsrGCyS_jYKf42Gw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: Add mctp-controller property
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_001519_754927_BA34676B 
X-CRM114-Status: GOOD (  15.63  )
X-Mailman-Approved-At: Mon, 03 Jul 2023 13:40:17 -0700
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

On Mon, 3 Jul 2023 at 07:31, Matt Johnston <matt@codeconstruct.com.au> wrote:
>
> This property is used to describe a I3C bus with attached MCTP I3C
> target devices.
>
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> index fdb4212149e7..08731e2484f2 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -55,6 +55,10 @@ properties:
>
>        May not be supported by all controllers.
>
> +  mctp-controller:
> +    description: |
> +      Indicates that this bus hosts MCTP-over-I3C target devices.

I have doubts you actually tested it - there is no type/ref. Also,
your description is a bit different than existing from dtschema. Why?
Aren't these the same things?

Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
