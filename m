Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6F4D3B98A
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VF3PwAkZ2wZSpRocEadJzAr2z/FkldXkVyaJfUUID/s=; b=DxEe3kP4BerLLR
	o5Gvgb5jQxPg73QDUiOzq6yQf90UmY8Jcw3x88i+t+DvJ7VeZFdy9aP6JpX9V/bAzoyg0tkudYbWi
	WvQYurHaW81W5bNsn/Ih4DYvfuUI3QStnn0rpi0RFrNqqaTKdStHr6w3wXO3y2ArwQO8JOLRUo4Ql
	gRfcVKNE3OjjvD46RM0U3V1/fLWH8Jw5OCmfI+dDGjeCwb6IIV3xgxxIbYW8jfm7Gtgxuz85ha7jt
	x+hU5RtoJb0ZzhKgqGeGInHKPAJnhbMfgDfUWq9F3hLbge1tQHc4A6tK9NikeAPahT5ZkO35fLStw
	6eY9yV/9mMKs66diznUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1SY-0000000EajE-1lEk;
	Tue, 09 Dec 2025 17:25:10 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1SV-0000000Eaim-1ROF
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 17:25:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lc398UsloMDyLXpvF9R2xofNAZKMAyeS9Ov+E+HLQ9995Qbftjtmblm17sSGSu35JgwORX3Owc1EHGwsBa/CZLfvT2DxWcVAxaiVLth49TFC+xaV8WEGLQ2pAv7a7kbdDePR//nuAE2fAfjuP3lKe0hS450nhhunEJfA49qu2SN8C0KFmEnGfXluaVw0j9em+1SPm7EDlrHdemxjyrYSltGFQbuS2nkxUZUbjA9lkPwg6BofEw6EWxIYIjHe5WvZkl0XWRmhN60L0lVhktLwqjYLiSJICk4U0UZg+xU/VBmPnXlhNQFyD2n87FwGtAoxZmKS2DglDC8nBZ4gSkQ4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V56u2rAvHsZu+GoZ3PnQb95MdxOciR9n7mnHtbW6mxA=;
 b=gZkv1Vq4SBArqMvEQGeuMR9ygROh5E3QCNtR3dtnAh7Q0SUfW5gDS7FMTGf+bmKVId5AYIVO6l82a8M9rQj9SCPfW0F7m9drmYsGLMrX4nekCjIHvmJIJAKLsx5l+Can0c5lEC9ix0EUYcVdvo1DtsAH0GkCiMCIo95oSQDyAG5ufqS6ibo0vfH7D9MueyKjBptWSUGk1MBvAVCxjYsP1KSnEZ92PthdVW5n5todp19hhGqVrkhrnkVFFTPS2Lww/0fmKEaTvReoVVlXm1C0ZMejRDC7w68iIp+sdHH/wPbcFIMuOgjJUXhWikYaqcDJhqvn1cj5mjMD/7ugEBoH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V56u2rAvHsZu+GoZ3PnQb95MdxOciR9n7mnHtbW6mxA=;
 b=fMM1nnaAAuHp+FyjctZOhGOx781VEKCG/AjQECqVv6VfE/Apuc5qAw35r/V0R6R6poL/2tlyJRLcCmJVgUQxLMTt4xeqkdtjDYdSbi+PMBV2ZxhpIl8iLtb+8NqY/w3Y95LNbYZImm67kLKBxTztmprG/tOnPMrRgj3BpPfbxONBx2X4txhL43GHVfmrhyzvbtBkaytPUyaeXOC6mK6X663+kuV43lBYGYVI85i9vh65gCXrLj5LbKcaz9y2WCRkwf24AuB3etXoGPvwJ4MsmLv+5qPf70H+ZjJ58VGZ3gkikpkzcu2Y5BVizOL4zuBSXjvD+pQrpusxIWx5Fbgd5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DUZPR04MB9945.eurprd04.prod.outlook.com (2603:10a6:10:4d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 17:25:02 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 17:25:02 +0000
Date: Tue, 9 Dec 2025 12:24:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Louis Sautier <louis.sautier@ovhcloud.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
Message-ID: <aThbaFalAXblN56U@lizhi-Precision-Tower-5810>
References: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
 <202512082058408ee92ee8@mail.local>
 <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
 <202512091248543fcf4c83@mail.local>
 <c7e29aeb-c258-45e6-af78-9a81ee8de327@ovhcloud.com>
Content-Disposition: inline
In-Reply-To: <c7e29aeb-c258-45e6-af78-9a81ee8de327@ovhcloud.com>
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DUZPR04MB9945:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ed1337-cc98-43ee-7e74-08de3747e2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PnUY5dIGPpgS3i2M7XiljJK+TMZ40rPMMsKZGRHhlaEFwIr2NTTY02JQH9?=
 =?iso-8859-1?Q?a50fXK79pjEIUZkS6QS0QENJ9QoUAV6BsUFm4XTGorr/GxyS9VKeEvdEqf?=
 =?iso-8859-1?Q?oHiLMtCZG6Qt8mzQBqDTcGgAnE3pfA3N75lzUULm/OowxTs93LXWDbvaI6?=
 =?iso-8859-1?Q?AyosV4vCL+hrZ4tO+iUYC/fM7w11qlvYHbvyvw8Qb2VyBjb4HGkjhnZgDv?=
 =?iso-8859-1?Q?BkQwFj2NzKAuVwJFQTtZTt0UwvCnLtUNSETAVhrFGS0lPWzHAVDbzn54KM?=
 =?iso-8859-1?Q?B9G96oeFL2FiRrT6Vgolbwik115uA/ScWNhjKzZSKlrLYBZces7WSIOsoI?=
 =?iso-8859-1?Q?xuoaLRsSp/KMnjSoKLJIUMcBnsukptAZBnlkQtw5sF8GoFt94g3da4IQ77?=
 =?iso-8859-1?Q?NYRrBWMXeHiJBh/aU/Bz/Yf/6XSPnkmdphfaWeqTcnvYyqDPYJM7czL2SK?=
 =?iso-8859-1?Q?OvVX+xn7p5UKoxK3G4txP8NRW3LlLOhFjwxoKD1xbbv/yhTd/WPaTQQiTz?=
 =?iso-8859-1?Q?oA7rmLagr30Z9iU0WK0pSAK+9SJUnp42N0omPajVI+AeHFyOPoYFS/EYZp?=
 =?iso-8859-1?Q?N4ZW/wl5jLYNtOoavlZ6wYN6Xuu7Qwf1AYDG7UNTQmFFccddFFF38NVTHb?=
 =?iso-8859-1?Q?nQMFBjS1/yi2o1AF/4mwY+8H58hCGQD/A6RXoAVrcQRCaEOGNwOQRycqfY?=
 =?iso-8859-1?Q?/klRTHqiWzrRLab0aj7/X5VXHGdWLCdakk/iNHJiJcOoRLALNBNrvBO4bZ?=
 =?iso-8859-1?Q?IC3iiMAGL/vqn8KgFWXkr5u5vWdTy0RjbUR1OFRS+Sbh2VXQJh5Ni8MYcd?=
 =?iso-8859-1?Q?+yJO57n1jwnEytoBhF/BhYhw0GkM4f9ZHh6/hqyDDQN4ltlUuUPuo+f5H/?=
 =?iso-8859-1?Q?4CR449pXmeEALMlnL6d5RPEQihLv+WZc8ocCgCjiuCpJCQpA9yMQlFqHr2?=
 =?iso-8859-1?Q?9ZAxBWFeGnV5sNQY8OB+3BdGr1lDruwtmtMHDXgOszYkdu94U22EiWQ9qE?=
 =?iso-8859-1?Q?UdLPAJ9pq6rcsHrQFH0OQDNMfaCXEWcc7My2XUOZbuzFmr4sW7J5eZd2d1?=
 =?iso-8859-1?Q?mWLeENy0Cl+eWZB76dd/BBLIBRbeysrUW3seVKY5uj7XzLFQwVx3sbHXNG?=
 =?iso-8859-1?Q?x8OrD+9qQpoYgmLXo3rDZxM0AioweJsZSIBy3xT1oWKTTSxsRtmUHfF3wO?=
 =?iso-8859-1?Q?+3PXcToJAJQdqSZnPGzAvnLimVYcQfzBp7vzESCwnymtx9hJWUqUIEmjjV?=
 =?iso-8859-1?Q?B/ykgyEoz2ylnWiZWnTF+zqPBh4yq1cqWghbYjU7/ak+4/91IzHCcjpNU3?=
 =?iso-8859-1?Q?XLmjaAP1JqtWX/4KzALVwdbJoyYd0rGgPagykgZ4gjlwLwUBfJ0XyYiS7O?=
 =?iso-8859-1?Q?A4T/uoScJUYDQIE1jW+WyqMs/nVogGgzCSf7DwVD0mKsaRLuwCuNuktuy4?=
 =?iso-8859-1?Q?U5QL4KJMK+s3IDa9Xl+yl/Wxoa4bA4TCVvEfzI2jB066G2LbbxutLaOr1P?=
 =?iso-8859-1?Q?fKLE6Vmz3pCjeS4rlCYd6+zd0H95Pt5Wg5w5XBFdNONA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NBrcP/V8pVs6EaYRqLiKXVoSyJEJs0JR+EH1U1/9QfGQc6TT+ipUZAP7ls?=
 =?iso-8859-1?Q?xj33jYpfpGyZMQSHoDokYejPyJqbSgxKr5euMqeTNtHEHiyMEMfozpP6mk?=
 =?iso-8859-1?Q?kXY1tJ5BrGcjEu3RbfV3HyebeSUa7hHXJtX6lDqwmtMjGJ095nJv0WcFy3?=
 =?iso-8859-1?Q?7vZTmgRjKBVNaKMQvbHqvxGFCbA6ffGW/0ECPBWWddPZhwrhq6AlFqm+TJ?=
 =?iso-8859-1?Q?+eZZuqeabWPY1kapM0+C2wjTJ/tYrUaNO1DgPt0gLM0WR0cTJkdGZUZIml?=
 =?iso-8859-1?Q?RqPLpfWEHse+h6AWhMSm2KDtIgEsJYGzScfOzfHVX9le+trA6lFy73feEU?=
 =?iso-8859-1?Q?c64kyRpHdLelZSkscQdLMvJUuDKCNDsIirfqWiQTDYTpEbxvs30C3gI/ai?=
 =?iso-8859-1?Q?oH+4RS9KX2gxy8AynFtl12vHLw+rY1THXrYWWm3bbUQ1tcsR6js1mHGzBo?=
 =?iso-8859-1?Q?oqEROGSuPsZqz4I5B8BOCbR99zZG5YJcfNtA/5WLA+AYt7uQ390oqLaRVe?=
 =?iso-8859-1?Q?OOvyjqSbUDi4JraedtmetahPcO/p7oCHBXkUeHgQMu8+xgzcCq+qZo+3j3?=
 =?iso-8859-1?Q?ZDlHtCmx9hbPMWtucriLacV89e9Qc9dTpwE77XaFr8xS03+qR+sd15qtnH?=
 =?iso-8859-1?Q?aEeAb+1X5bcpVC7e3/MDzgtYGCi+rlx8z/jZWqzX9zRQlDv9+VdPB+JDEW?=
 =?iso-8859-1?Q?77C3QW32gIIaGjvnlH16dxOpEy3jl8hKxqmB+ZB+N1mxOw1qDlrRXNoYEg?=
 =?iso-8859-1?Q?aEl1lkbyqCs5gYkFREp94wq5G53DwtxfgnH63kiTbrdkGyGdQE4j/7CesK?=
 =?iso-8859-1?Q?Agsyst61pTuN0g/1A/luXNIKy92Gbc4zwM0jXOelf3skYawVXr6QJUDZjY?=
 =?iso-8859-1?Q?56+IexDDC7kaACD9M06wEAsxk/ZpmKV8z9xw1GTVtb674XjJMBVR06zBbJ?=
 =?iso-8859-1?Q?RPy5Yq9rMmRHTievnneY1tAdc+bqiA3FJOPQoZRBZT/PFbeSuUgP5VqUao?=
 =?iso-8859-1?Q?cDgCyCcLvPOJCe+9JJuuBhHRRUV+CVgfwAfHtYsvcOs7aXzY2dMssgurWx?=
 =?iso-8859-1?Q?SDq+GnfFlh07nq80NzVAnoC/ds87VGH2anUJ6vr0PnCFCH/9PZTWq0S56G?=
 =?iso-8859-1?Q?me9G/RietdEQs1p3lDB0f8caA5sbNoZ8gS4zWx/oxGOCgsLx7dvm1QjEeB?=
 =?iso-8859-1?Q?L2zBCO5csDSH9RRp1u2O1ZNxx7qcIlk9aD/xzPxcPEEQcH4/3nj3I7/H86?=
 =?iso-8859-1?Q?b7Eo2bpAkm6qr4CXAeG+7531qjJw+SJ/vzN35LZM+YMxDRaxrQVKWQyz4U?=
 =?iso-8859-1?Q?fAiIu9Mi4obpqq1Gsbqe6Ka7Wspcwar+1UxoihKvf5gM+KBV555mhZ6DjO?=
 =?iso-8859-1?Q?TkdnOs1GqcyUvp7K6VZVX1S4bmEgWzbPAepYr1I7YkI7wGf9R22oiqTrpx?=
 =?iso-8859-1?Q?3xABCbQXRVOpKyHVUbbJ9ogkOwiDEKWlMCQoH4SQ3jeT8RVZ9iLkXmGNvH?=
 =?iso-8859-1?Q?Y+jtaxLjATo8Yqiehr0VP6B5C7KTq0MuKt4sTEPQ8zS7oEeC7HpFxpqIkl?=
 =?iso-8859-1?Q?RSn1u21urawgkmDYC2DTZRnZQY80TVHjW8Dq94ttj0G2DdwdSWfIFTPXXX?=
 =?iso-8859-1?Q?KfczB1LviuMAI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ed1337-cc98-43ee-7e74-08de3747e2fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:25:02.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeQQmCNzYUMGFF5tkZELOen0l3lGJ9r4n3fK4jCPQ0lm5GtS61f8WsEReU49tYMvSMWNnnXj54m7pu11MQVB2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_092507_847574_A757933C 
X-CRM114-Status: GOOD (  30.42  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Dec 09, 2025 at 04:36:30PM +0100, Louis Sautier wrote:
> On 12/9/25 13:48, Alexandre Belloni wrote:
> >
> > On 09/12/2025 12:37:12+0100, Louis Sautier wrote:
> > > On 12/8/25 21:58, Alexandre Belloni wrote:
> > > > Hello Louis,
> > > >
> > > > On 02/12/2025 21:17:31+0100, Louis Sautier wrote:
> > > > > Hello,
> > > > >
> > > > > I'm running into a bug when loading the dw-i3c-master module on k=
ernel 6.18
> > > > > on one specific server. I suspect it has to do with the large num=
ber of
> > > > > CPUs=A0on the machine=A0(768 threads, from 2 AMD EPYC 9965 proces=
sors) but I am
> > > > > not sure.
> > > > >
> > > > > The system is on Ubuntu 25.10 and a 6.18 kernel with https://gist=
.githubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/raw/115da594d=
c9d7ea99b06754847571e6fd76d9da5/config
> > > > > (basically Ubuntu's).
> > > > Just to be sure, does this also happen with v6.17?
> > > >
> > > > The only change is the shutdown handling so I would guess yes.
> > > >
> > > Hello,
> > >
> > > It does happen with 6.17. I initially discovered this while running U=
buntu
> > > 25.10's stock kernel (6.17.0).
> > >
> > > > What is the behavior when you build the dw-i3c-master as a static d=
river?
> > > I'll try CONFIG_DW_I3C_MASTER=3Dy and report back.
> > >
> > > Someone also suggested (they didn't reply to the list though) that I =
add a
> > > printk to see what the value of maxdevs is. I'll provide the log as s=
oon as
> > > I have rebuilt with:
> > >
> > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c	2025-11-30 22:=
42:10.000000000 +0000
> > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c	2025-12-08 18:17:33=
.151567225 +0000
> > > @@ -1588,6 +1588,7 @@
> > >   	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> > >   	master->datstartaddr =3D ret;
> > >   	master->maxdevs =3D ret >> 16;
> > > +	printk("maxdevs: %d\n",  master->maxdevs);
> > >   	master->free_pos =3D GENMASK(master->maxdevs - 1, 0);
> > >   	master->quirks =3D (unsigned long)device_get_match_data(&pdev->dev=
);
> > >
> > Yes, that was going to be my suggestion.
> >
> I haven't tried with the driver built-in yet. This is what the printk sho=
ws:
> dw-i3c-master AMDI0015:00: probe with driver dw-i3c-master failed with er=
ror
> -110
> maxdevs: 65535

Maybe ret is bigger 0x8000_0000, and ret is sign int. so >>16 because -1.

unsigned int val =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);

master->maxdevs =3D val >> 16;

Frank

> dw-i3c-master AMDI0015:01: probe with driver dw-i3c-master failed with er=
ror
> -110
> maxdevs: 11
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:885:12
> shift exponent 64 is too large for 64-bit type 'long unsigned int'
> CPU: 0 UID: 0 PID: 7363 Comm: (udev-worker) Not tainted 6.18.0 #1
> PREEMPT(voluntary)
> Hardware name: Giga Computing MZ73-LM2-000/MZ73-LM2-000, BIOS R23_F43
> 11/28/2025
> Call Trace:
> =A0<TASK>
> =A0dump_stack_lvl+0x5f/0x90
> =A0dump_stack+0x10/0x18
> =A0ubsan_epilogue+0x9/0x39
> =A0__ubsan_handle_shift_out_of_bounds.cold+0xdd/0x1c9
> =A0dw_i3c_master_daa.cold+0x1a/0x90 [dw_i3c_master]
> =A0i3c_master_do_daa+0x30/0x90 [i3c]
> =A0i3c_master_register+0x616/0xa80 [i3c]
> =A0dw_i3c_common_probe+0x298/0x2d0 [dw_i3c_master]
> =A0dw_i3c_probe+0x30/0x50 [dw_i3c_master]
> =A0platform_probe+0x42/0xc0
> =A0? driver_sysfs_add+0x63/0xd0
> =A0really_probe+0xf9/0x370
> =A0? pm_runtime_barrier+0x56/0xa0
> =A0__driver_probe_device+0x8b/0x160
> =A0driver_probe_device+0x24/0xd0
> =A0? __pfx___driver_attach+0x10/0x10
> =A0__driver_attach+0xef/0x220
> =A0? __pfx_dw_i3c_driver_init+0x10/0x10 [dw_i3c_master]
> =A0bus_for_each_dev+0x8a/0xe0
> =A0driver_attach+0x1e/0x30
> =A0bus_add_driver+0x13e/0x230
> =A0? __pfx_dw_i3c_driver_init+0x10/0x10 [dw_i3c_master]
> =A0driver_register+0x75/0xf0
> =A0__platform_driver_register+0x1e/0x30
> =A0dw_i3c_driver_init+0x1c/0xff0 [dw_i3c_master]
> =A0do_one_initcall+0x59/0x330
> =A0do_init_module+0x8b/0x290
> =A0load_module+0x1f2f/0x2320
> =A0init_module_from_file+0x9b/0x100
> =A0? init_module_from_file+0x9b/0x100
> =A0idempotent_init_module+0x10e/0x300
> =A0__x64_sys_finit_module+0x73/0xf0
> =A0? __secure_computing+0x84/0xe0
> =A0x64_sys_call+0x1f04/0x2350
> =A0do_syscall_64+0x82/0xc80
> =A0? vfs_read+0x179/0x3a0
> =A0? vfs_read+0x179/0x3a0
> =A0? __rseq_handle_notify_resume+0xa2/0x4e0
> =A0? exit_to_user_mode_loop+0xe6/0x190
> =A0? do_syscall_64+0x25c/0xc80
> =A0? irqentry_exit+0x43/0x50
> =A0? exc_page_fault+0x90/0x1b0
> =A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x70c8bf1348cd
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff
> 73 01 c3 48 8b 0d 13 f5 0f 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffd8d0e4cf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 000059c987bf15c0 RCX: 000070c8bf1348cd
> RDX: 0000000000000000 RSI: 000070c8be74b336 RDI: 0000000000000065
> RBP: 00007ffd8d0e4d90 R08: 0000000000000000 R09: 000059c987bc1070
> R10: 0000000000000000 R11: 0000000000000246 R12: 000070c8be74b336
> R13: 0000000000020000 R14: 000059c987be8cd0 R15: 000059c987bb1440
> =A0</TASK>
> ---[ end trace ]---
> maxdevs: 11
> dw-i3c-master AMDI0015:03: probe with driver dw-i3c-master failed with er=
ror
> -110
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
