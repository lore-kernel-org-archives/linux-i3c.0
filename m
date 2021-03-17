Return-Path: <SRS0=AFd6=JV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58275C433B4
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B5E61452
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0B5E61452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=itfROXmFaeXVvB42UK6himQlj3Ve4zvMCS4IQI5qbeg=; b=gbSO4fIhVQl6bzCrRru4MaucX
	wgblMSgYtJtvQCznxpyB2u7cnnrb+vSADOTF27uQTwHK4lyqbBXswhk1ptU5jq1gIcE83ZvAYYM/L
	cYOAGRETerg3fnuGJn8kSMvm/QYX54qNvlVUxoDS+J7CWVhFDPKuD+pU+hQDYJSsaswuvGGI+ctiJ
	V+2laRBP3fhade+nRZsxubIvh/bCL2kI4QJCm9DrYoPTd5Iv8fAtBOzZsJICvRegQ1p6vgCPX1Isw
	hULCtX5ra5jkUCR6Kn/lLrLBQlH54uLSCyhKVMYi8ijeQxvK6zrePofQMR4c65hh7b1zsXzgbUUmT
	79I5Lcv7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laOgc-004Ms3-Vp; Sat, 24 Apr 2021 20:15:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lML6D-002ECW-NW
 for linux-i3c@lists.infradead.org; Wed, 17 Mar 2021 01:35:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F4F364E76;
 Wed, 17 Mar 2021 01:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615944948;
 bh=wfVsG34NpnkPgDNvkfeM6rHhymxXjOqDbCNsoIlma9s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YIqypZavA3LNYBIPc1EreM/QDPJFqyeB+Xdvbxq1wCfvXWZPydjiMAe93cDQh4+eP
 gNfTj7D7paWO1O1uNQp5ZMkVeXR4tM+BdMTxVPf7ZHJgcbbQYFnHQUnkS0MbaK6aBI
 1lYIEDicUaOY6H5SCN9STWjcGvWH9N6oQxERx16WPgjZ+GZOtcqa4v8Cv9dr0er7bD
 zXQaQIScBIieUeVWBkI/izQUVGrDePmYFQnkIK9ggZdGQlXuXgCXkOD/lXjuMFUPAa
 ElY2b6rfq+i9r07KPQ0xNtZvpLo2I2UF9Ks3/hgj/xLiUs+4v6dyI4uRkLJEViE+go
 QGH6AH4BQz8Jg==
MIME-Version: 1.0
In-Reply-To: <20210316194918.3528417-1-robh@kernel.org>
References: <20210316194918.3528417-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Clean-up undocumented compatible strings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Vinod Koul <vkoul@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Tue, 16 Mar 2021 18:35:46 -0700
Message-ID: <161594494696.1478170.13888306623342465859@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_013550_010976_17287053 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 24 Apr 2021 21:15:22 +0100
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

Quoting Rob Herring (2021-03-16 12:49:18)
> Adding checks for undocumented compatible strings reveals a bunch of
> warnings in the DT binding examples. Fix the cases which are typos, just
> a mismatch between the schema and the example, or aren't documented at all.
> In a couple of cases, fixing the compatible revealed some schema errors
> which are fixed.
> 
> There's a bunch of others remaining after this which have bindings, but
> those aren't converted to schema yet.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-clk@vger.kernel.org
> Cc: dmaengine@vger.kernel.org
> Cc: linux-i3c@lists.infradead.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
