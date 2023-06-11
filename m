Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA9C77B7A
	for <linux-i3c@archiver.kernel.org>; Sun, 11 Jun 2023 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJXlBiddMAFZLIOkddkdXXpDRziFbdXUeKXk4WQCH48=; b=Wo+ZBHzmw+x5hP
	cgpCKqLD/JovBCoC0ay3NmgFMx97TV8y9ZiXovbxEQe3Zdtn/duVa7+DiEQ8WxgdhfYV1io7myaMl
	91N/vsHotZnMfCh7UmRNNZsYQUGzHNsl2DmVS64xLwA7/6QNGehAWsTbCu+WD0yMKAKxqXSf/6Ku2
	LiJeWBMK3StqwSMcSlHCmUTmsvbpIZ16NVXGdv/ey4bkWcIzgcMCxwtstjI64bDJQ+UTOPlw7+b5B
	y6g40xm8C8G+yRl1TN34h7xXXgEghoeYeQMi6+JyL8PkN6GGDbEf4sRscrzbekVMFabQv3J4iugvC
	Nu0/mI9cDkdjfDzWd2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8MwX-001DU7-38;
	Sun, 11 Jun 2023 15:25:26 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8MwU-001DSO-14
	for linux-i3c@lists.infradead.org;
	Sun, 11 Jun 2023 15:25:24 +0000
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686497114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fiEW/G41BWiGsN06YA7FOjBuZy9frZVGjVph/Ohsgis=;
	b=ERf26ZnjhSj/0HgohekTGulJ4OdiZInwm21U1G3Y9Ff34NRP4E+OcIacvZ23TAhGQES2TI
	quWgywmOuvJh5TkwcLkPnAEY/8nD4D/QrEHvLS8MBdeArk0F88eg3m5eQQ5nZ4yBFGIqBy
	ixEQFuZgdKkHyHqdFpdVISAubexyBLUBvZqKKtNGZ0I7DdkOYPm7ikbvkfLShj2Pfjp1Ct
	H9F9qCLrLNKPY8h/YJMv15NY/SfUYxwO+L75aJ7C8pkMSlpcvQvCc59AFUT1gV1/jtfznr
	Ok8Qqa4kHRJrviR+WcUUBl3r+HstFay0SnyTJA8KYzeCEQBu4W3UDLBpbyBBGA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9A6240004;
	Sun, 11 Jun 2023 15:25:10 +0000 (UTC)
Date: Sun, 11 Jun 2023 17:25:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i3c: silvaco,i3c-master: fix missing schema
 restriction
Message-ID: <20230611152510003a8361@mail.local>
References: <20230609141107.66128-1-krzysztof.kozlowski@linaro.org>
 <168634884066.2555331.39755837725706368.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <168634884066.2555331.39755837725706368.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_082522_540869_D54FF6A3 
X-CRM114-Status: GOOD (  12.20  )
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

On 09/06/2023 16:14:03-0600, Rob Herring wrote:
> 
> On Fri, 09 Jun 2023 16:11:07 +0200, Krzysztof Kozlowski wrote:
> > Each device schema must end with unevaluatedProperties: false, if it
> > references other common schema.  Otherwise it would allow any properties
> > to be listed.
> > 
> > Fixes: b8b0446f1f1a ("dt-bindings: i3c: Describe Silvaco master binding")
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> Applied, thanks!

As you took this one, I assume you are going to take the previous patch.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
