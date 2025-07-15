Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32433C83F27
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jul 2025 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+x3snODUsh82QeG3lwGcFTB4n1F8Czhp0v8lcfSZF8=; b=dUZc29E1aUHV3b
	0pUPAkmBzJkpToMa5iS4wxCQIdG7yu3Pm7af5iRiV2jcpeZytM7T4mF/glf95MvKKuSn32b1EjsNK
	LItkP+p+FNYR0OwCEL/PGfjbQcm1IGJLoSGz/QWzbUksse3PHRmA71UI36bZeS6Jse9oeL6gJjbtK
	rf8QmkIWJm0fBPwbTZTW0Kmy5YRmVPzKik6RdDV2cSaKiZfJx+nWBL7BFRZ/7i1aPn/47AxLuj29H
	jz8czQ8ctVRwD5qqcSHJCnMj8AAGOLeC1S2biNjg9UZ9HoX8sEoRloC2UfAEyUABrW8zApj/pdznO
	yi+D7hXgTLf0F10KgtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubmJr-00000006BUG-42Fl;
	Tue, 15 Jul 2025 20:32:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubmJo-00000006BSj-0yPU
	for linux-i3c@lists.infradead.org;
	Tue, 15 Jul 2025 20:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oV9T
	I9+WIfNxHB52qrKd+4mDBoXh5YTq2uE9DShiIqo=; b=OHxHEM6uG0/V0nVW0wHP
	+awGoIpUz7837FzcreVK0YwTT7JmDYzRNqAMEt0KdKdLzmSkqngW0wTmjize18Gv
	xtKJRYNxu3f3I2MCCmbzvGLQ8/EWF2JEzBXRYvVhywRYoczwxTp8BhJ6xPfkpgGs
	0qdlA8nAZrkgKNOuIh8MpAxnbKUekHXslaXNFH5FDFGXkUZAQR/NrsZtSy+XJfgT
	kOrGFtHvSCXF6Yzi3RfR/qOW4tk0QXibjMHg20DKqeRJ30qYZnxZPmrVbrc/sFUQ
	FWvOZHJ4JiDg/H5hPkU5HEVPTCvwRn0Sc+B+fSoaOmetn+p2g4zhDmzVa9WwxfTf
	GQ==
Received: (qmail 3035793 invoked from network); 15 Jul 2025 22:31:58 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2025 22:31:58 +0200
X-UD-Smtp-Session: l3s3148p1@IsDyqv05cOAujnsR
Date: Tue, 15 Jul 2025 22:31:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH v5 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <aHa6vc9g8lpvPdWO@shikoro>
References: <20250715-adi-i3c-master-v5-0-c89434cbaf5e@analog.com>
 <20250715-adi-i3c-master-v5-2-c89434cbaf5e@analog.com>
 <aHZzImGbgISePnNJ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHZzImGbgISePnNJ@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_133205_140304_8E042A7C 
X-CRM114-Status: UNSURE (   5.67  )
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

> >  M:	Jorge Marques <jorge.marques@analog.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > +F:	drivers/i3c/master/adi-i3c-master.c
> 
> Add i3c mail list?

Not needed because it will be inherited from the I3C subsystem entry:

$ scripts/get_maintainer.pl -f drivers/i3c/master/ast2600-i3c-master.c
Jeremy Kerr
Alexandre Belloni
Frank Li
linux-i3c@lists.infradead.org
linux-kernel@vger.kernel.org


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
