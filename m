Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A351C77B61
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Apr 2023 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hq6aTc/MkXCyZ8wRqd/QbEAIh135t2AuyOc8W/zgDIE=; b=TO2Bpyzm/yCT/N
	w7X7HS3UWJmDEwjGY77Tan7nC/A3VPfHmF6fxl2Og5dQrylwizorwuDiVuTxcXfMw1G1qzp0cWaRG
	nOfcfJNoA9NBqH7931SoiLf4voUJNnmKuia17L2yvERH5sN0O/E7d/VfyrtrZlkr7B3Q4WxSAXolU
	QJ1EDbDn9kjw1UQN23Za9uqDpW350uL5CZx2sHHmmt0RPPmG66vjcCbgOSEeq8hj4q3kp/hAX86He
	OozUhgvSIrs7hJqU+7jaHr8NxFVn2GexgSBw9T8mzX5nIH9m5NHY+2d6VELsM4dopNqqFzD4ueXoF
	cUOuT3X6opzmPalntu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psIcW-008Qqi-2H;
	Fri, 28 Apr 2023 07:34:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psIcT-008Qpu-0g
	for linux-i3c@lists.infradead.org;
	Fri, 28 Apr 2023 07:34:18 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 776AA20009;
	Fri, 28 Apr 2023 15:34:08 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1682667251;
	bh=N/rivLQZkz7MwoDB13/S1Ui9U94NDmdIZ7ys2tgTt5w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HVfiNJLqW+M+9rWWgwgpAEBq+acLeavgwBvSj9nGbxFOs/4MnQfheiadAJlL91Cvq
	 NvrUwi1AxUBg9NZfaQExn+Pt1Z1pqX/u8PDekZmUDucBARwEKYzSlWD6R4a4hlRpKV
	 AFd8fqFLHLI9xc0SMg8y1NmePUiA05PxpxFO94ocEcg5oIlew+cf20zG+wNNLySzeT
	 /PW87ysFWaBpjs7+fZFEdh8mm2D/0SSG5Jbyy/MSJY94h5+pXWkuFbi5gjcVWG4GRW
	 W2XT5VyqSfoY6/FswQVmQje8nL0oaTTux4vfjxZY67NZs4+P+Dj4B6OzyqdB7It3ry
	 3H8jkTKlTzCfw==
Message-ID: <c403bb904cf92348b32e2b4e90d5b11fc1cad641.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/5] i3c: dw,ast2600: Add In-Band Interrupt support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, Matt Johnston
 <matt@codeconstruct.com.au>,  Vitor Soares <ivitro@gmail.com>, Jack Chen
 <zenghuchen@google.com>, Billy Tsai <billy_tsai@aspeedtech.com>,  Dylan
 Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>
Date: Fri, 28 Apr 2023 15:34:07 +0800
In-Reply-To: <20230428065137097609fa@mail.local>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
	 <202304272235234c8f3955@mail.local>
	 <cda6874790ced41cbbeca5b5dbfe39be869fb2d4.camel@codeconstruct.com.au>
	 <20230428065137097609fa@mail.local>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_003417_673375_ACC603A1 
X-CRM114-Status: UNSURE (   6.10  )
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

Hi Alexandre,

> Indeed, I fixed that but this wasn't the issue. Patch 5/5 doesn't
> apply. If you look at the context, it has "struct
> ast2600_i3c_platform_data {" which is "struct ast2600_i3c {" in your
> v3. Also the chunk in ast2600_i3c_probe() can't apply.

Ah yep, looks like I'd got out of sync with the series for 5/5.

> I fixed it up and pushed, please check.

Looks good to me, thanks for sorting that out. I'll do some testing here
in the meantime too.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
