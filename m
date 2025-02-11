Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3A2C0219B
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Feb 2025 21:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJ2Z+Yv7APiTXjQJt8icNdF/InJLhVoAqQqwdeOHTT4=; b=j4uAOJDk4OGhNI
	pGr0Fuz0XzNbWIuNZNjZcTfU+swt2nt5E0NJy3mOqR3A7SyyF2Y28HkKHc0vuf+3+eCJPBf1sb/jE
	aiOzMNSzNiGmT+dcf8u6EJWjWHxsdG9EyvIsXZRgu3XmMrqD7k96CnlbydfUnBBPdM6i58g8tCoTd
	0EcIGFiS9pHGVwWQl5h/OSE+ajuGJAgv43GvIDrMu4UXqzJZmB9BWIazoX2Z023UdKPoneXLiie42
	Sc0ni8/Yhrcyf9yaGQA10RTuEJ4a8Kmha0jYtv+uE/qZJq4/+znuZ8oc9mac7WsVdGG6o3ZdTBq6T
	UcN90atEkmHSRCjWi/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxyb-00000005NEk-3ce6;
	Tue, 11 Feb 2025 21:39:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxyZ-00000005NDg-0BTs
	for linux-i3c@lists.infradead.org;
	Tue, 11 Feb 2025 21:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF9595C4C90;
	Tue, 11 Feb 2025 21:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED68FC4CEDD;
	Tue, 11 Feb 2025 21:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739309966;
	bh=FJycInZp7xLnccM2iFP10pmSMU2kK51uCue1d6X+XO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP4BATfYQC25wggrvRK+B62zM9TQ+bR0hCVhUWH4cji6/wep0juNbEW2L9FxK1Eat
	 sGvPeE8MrAnft7dpLlkUy5yUm8/hxi5ikl8+3Mc28c4tZEiRMJMy/fDd8D1xy0eQya
	 pnhNKAswSjU3cbZei39Nm2iAeOSM7Wrq6uNn51EPfCn3dPPkEfYE5W5n6uIupuoWnM
	 5FK5pxfOj5XCaSthnTiXPtAlyWeoDON2+i3O1N+vWtTrG03/cZZ6WqFWRbQ1aPPdoE
	 DsYpKoDfrL2iHJSKnGKvtmG1XYAY7ERQF+XfoQz/XnQE9ubmFZboS3LEAw6bIpqFDG
	 vZ0e7USejBvnQ==
Date: Tue, 11 Feb 2025 15:39:24 -0600
From: Rob Herring <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
Message-ID: <20250211213924.GA1215572-robh@kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
 <7c518972-75df-4c8a-8920-06d5aa2849ae@kernel.org>
 <b7f2c973-e161-4b83-9b3a-415e84510bd2@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7f2c973-e161-4b83-9b3a-415e84510bd2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_133927_175568_7C143DA0 
X-CRM114-Status: GOOD (  32.70  )
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

On Mon, Feb 10, 2025 at 09:42:03PM +0530, Mukesh Kumar Savaliya wrote:
> Thanks Krzysztof !
> 
> On 2/9/2025 5:15 PM, Krzysztof Kozlowski wrote:
> > On 06/02/2025 14:43, Mukesh Kumar Savaliya wrote:
> > > Hi Krzysztof,  Thanks !
> > > 
> > > On 2/5/2025 8:12 PM, Krzysztof Kozlowski wrote:
> > > > On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
> > > > > Add device tree bindings for the Qualcomm I3C master controller. This
> > > > > includes the necessary documentation and properties required to describe
> > > > > the hardware in the device tree.
> > > > 
> > > > A nit, subject: drop second/last, redundant "bindings". The
> > > > "dt-bindings" prefix is already stating that these are bindings.
> > > Sure
> > > > See also:
> > > > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > > > 
> > > > Use modern terminology, which means:
> > > > s/master/whatever else or even nothing/
> > > > See other recent bindings and discussions.
> > > > 
> > > Sure
> > > > 
> > > > > 
> > > > > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > > > ---
> > > > >    .../bindings/i3c/qcom,i3c-master.yaml         | 57 +++++++++++++++++++
> > > > >    1 file changed, 57 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..ad63ea779fd6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> > > > 
> > > > Filename matching compatible.
> > > > 
> > > Changed compatible to "qcom,i3c-master"
> > > > > @@ -0,0 +1,57 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Qualcomm I3C master controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: i3c.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: qcom,geni-i3c
> > > > 
> > > > No SoC? So to be sure: you claim all future SoCs will be using exactly
> > > > the same interface. No new compatibles, no new properties will be added.
> > > > 
> > > I think i should remove const. kept it for now as no other compatible to
> > > be added as of now.
> > > 
> > > let me remove const.
> > 
> > No, it does not matter. Keep const.
> > 
> Sure. I reviewed other files and seems i should write as below. Please help
> confirm.
> 
>   compatible:
>     items:
>       - enum:
>           - qcom,sm8550-i3c-master
>       - const: qcom,i3c-master

No, that's even worse. I doubt there is some universal, never changing 
QCom I3C master.

> > > 
> > > SoC name is not required, as this compatible is generic to all the SOCs.
> > 
> > That's the statement you make. I accept it. I will bookmark this thread
> > and use it whenever you try to add any future property here (to be
> > clear: you agree you will not add new properties to fulfill *FUTURE* SoC
> > differences).
> > 
> Sorry, i am not saying there won't be any other compatible but i was saying
> base driver will use "qcom,i3c-master".
> After checking other files i realized there can be const compatible but
> other SOC specific can be added as enum.  Hope above given way is fine.

AIUI, "geni" is some firmware based multi-protocol serial i/o controller 
and we already have other "geni" bindings. So really, it's probably more 
coupled to firmware versions than SoC versions. If we haven't had 
problems with per SoC quirks with the other geni bindings, then I think 
using the same "geni" here is fine. But we won't be happy if we start 
seeing per SoC quirk properties.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
