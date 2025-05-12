Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7E6C3ABC3
	for <linux-i3c@archiver.kernel.org>; Mon, 12 May 2025 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCdl4OAkK4XopzC0ivLJ4/FEWksjWSX6WJdfbmjDHzw=; b=DlE99NZlL14RoI
	TH/T2edOZu1nFem8bihTOY+T3i1gongEEPA+lXTUXe+OFcNQSwxzBUpiRsJa518d+njEaVrX1ywod
	cL6a6viJmulEFnQI8JXQeVs341WVo3t/9nOvyd9+IgQGzhDOyBPzxD4ghgkNYmzw8DWG3BvoUNe+/
	cBOcxxtxr+eb7bSjBLlWCumbqWnAg/+Jx0AWqOXcuCLLmQlWxXOZMmT4BcopIQYtGCrA0xL84A/we
	nRp3IP2b5p2OIFFPXnKEOcsavrtzQqJyqchjc07uvOTG1xAa1aUi0pnOHM5hyp9e6+GSxl1dz3b56
	tMXMf2FpTPjDWqYGWGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQ7L-0000000945L-4AZz;
	Mon, 12 May 2025 10:10:39 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPPW-00000008vAg-05k7
	for linux-i3c@lists.infradead.org;
	Mon, 12 May 2025 09:25:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8ED743284;
	Mon, 12 May 2025 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747041918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OLSHO2Ibs2uoIHZrl9Xn5cSfahZ7tkgcZIzEwxzVdy4=;
	b=oM8oOPXdDFoFnYhlHrGrcIe4CG/Ex8eoF29mMpTzDa4skMFmN0wxKB9InrYu0A2XX5kISl
	IdqwbEeqroNrcN3vwnXjqC3FdPTwcDeWfszZ2jyK6vuFvi0ySKsjFklBXL3Z85xbIRcaQz
	9fdOPyuALkEEK0sX81UP0Fr+yWf11p0RM/95lQ8PC0UFTetPReRsHX4vzDdsAheyLjqmrg
	gYBmJ3H06k6HsW9VAOl6DpBxf0gwr+ub8dvIe2eaWcJHrTY1ni9wpL62lxudV4RTwtaq+n
	ZL2OmAiMPKplVLAImdwI9QqBS/D3amh9wBr6qJRJSz17oLUQZf4qTXw9flfs5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
  linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE
 MASTER),  imx@lists.linux.dev (open list:SILVACO I3C DUAL-ROLE MASTER),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 1/1] i3c: master: svc: skip address resend on repeat
 START
In-Reply-To: <20250429054234.4013929-1-Frank.Li@nxp.com> (Frank Li's message
	of "Tue, 29 Apr 2025 01:42:34 -0400")
References: <20250429054234.4013929-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 11:25:16 +0200
Message-ID: <877c2mmb9f.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022522_204588_0CA8EDEF 
X-CRM114-Status: UNSURE (   5.47  )
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

On 29/04/2025 at 01:42:34 -04, Frank Li <Frank.Li@nxp.com> wrote:

> According to the I3C specification, address arbitration only happens during
> the START. Repeated START do not initiate arbitration, and In-Band
> Interrupts (IBIs) cannot occur at this stage.
>
> Resending the address upon a NACK in a repeat START is therefore redundant
> and unnecessary. Avoid redundant retries, improving efficiency and ensuring
> protocol compliance.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
