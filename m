Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9A5CDB483
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N82OnqmS3pN6n+EG+RC8ZfYFccCLjFIB0f30DHkZFRU=; b=fz8RqG6GigxHFZ
	FqoKsFFdk+PgAnR82Qxgux+16nI4PGWa7wUhknos8eSbb6mkscQfWgUSKw75sURG7pmA46W9gD0gR
	60dbnragh06urixF1XRVzKsRiNfIsqSxAwaYGoE/frctKH4tRCON3YggBXgT4kCewvJ0gR9PwJI+m
	1g9V/l3FgKrQpq0k8L0nsxuPtEs23gHRqw5miVYeTrE8BQh1wffRtbS06McBglTKSI/H7dB3MiAGU
	XDBYV51O/YlvCtj6fE58r42GjGjUIDvEujw9ukSjP5gpswLA0hUg/foQWINZ2A3sR5stIV9T4ho7l
	SAfTlof9JZf9ortn2PLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdsG-00BTa2-0T;
	Tue, 17 Oct 2023 06:48:16 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdsC-00BTTl-1A
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 06:48:14 +0000
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 24F71C0F2B;
	Tue, 17 Oct 2023 06:48:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id DAD026000F;
	Tue, 17 Oct 2023 06:48:04 +0000 (UTC)
Message-ID: <fe2148dd4e1547a937624ebb63653ab0ccb04383.camel@perches.com>
Subject: Re: [PATCH 1/5] i3c: master: svc: enable hotjoin default
From: Joe Perches <joe@perches.com>
To: Frank Li <Frank.Li@nxp.com>, alexandre.belloni@bootlin.com, 
 miquel.raynal@bootlin.com, conor.culhane@silvaco.com, 
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Date: Mon, 16 Oct 2023 23:48:03 -0700
In-Reply-To: <20231016154632.2851957-2-Frank.Li@nxp.com>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
	 <20231016154632.2851957-2-Frank.Li@nxp.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Stat-Signature: et6su1xwce3dtrnwgysedozf1b4j9j5n
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: DAD026000F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19nBGLglaohdnaFWs3DLGAZ7gvN1Q9+Zm0=
X-HE-Tag: 1697525284-635529
X-HE-Meta: U2FsdGVkX18ETq3OzcCKkIPupHhpUnAvv10wje3N9/qYvE1f392xyyMaj5KGvniZGbc7fo2/0vv3QM+FZi69qvrUgs8R9MBHFEPUIjzz4gOYK4+V71tXP+Xbyodzz9Os+dW/uBD1Fe2AAhfPBt1Hi7Yumt+cN32t0xEmmbu+uFhlpzpozFJipxDHpbHb8TZNZOUnJUlgDi2LOfCO26IHPa1RMYfZP/SiEZaXKa+/Bw9+lBqwXnZIF+5ZSCvpvgecnK1YJw0/OHXHg1l7KFq6W3kPkN7ZRTPQbLf8haVMzdb/mgkOesa2KQkXdOdEq460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_234812_491924_AF9B4DBE 
X-CRM114-Status: UNSURE (   6.51  )
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

On Mon, 2023-10-16 at 11:46 -0400, Frank Li wrote:
> Hotjoin require clock running and enable SLVSTART irq.
> Add module parameter 'hotjoin' to disable hotjoin and enable runtime_pm to
> save power.
[]
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
[]
> @@ -128,6 +128,9 @@
>  /* This parameter depends on the implementation and may be tuned */
>  #define SVC_I3C_FIFO_SIZE 16
>  
> +static bool hotjoin = true;
> +module_param(hotjoin, bool, S_IRUGO | S_IWUSR);

Might be nicer using 0644

Consider using checkpatch --strict on the series.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
